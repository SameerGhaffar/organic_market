import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/model/cart_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/model/user.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/cart_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/tempdata_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();
  final _authService = locator<AuthService>();
  final _tempService = locator<TempdataService>();

  final _cartService = locator<CartService>();
  final _navService = locator<NavigationService>();

  bool isLoading = false;

  // getting id from cart then finding the item from the list
  List<Item> cartItemList = [];
  List<Cart> cartList = [];

  Item cartitemData(int index) {
    return cartItemList.map((e) => e).toList()[index];
  }

  int cartItemQuantity(String itemid) {
    Cart item = cartList.firstWhere((element) => element.itemId == itemid);
    return item.quantity;
  }

  generateItem() {
    cartItemList = _firestoreService.itemDataList
        .where((item) =>
            cartList.map((cart) => cart.itemId).toList().contains(item.id))
        .toList();
  }

  String? uid;
  Future fetchData() async {
    uid = _authService.auth.currentUser!.uid;
    _firestoreService.itemRef.snapshots().listen((querySnapshot) async {
      await _firestoreService.loadItemData();
      await _firestoreService.loadCartData(uid!);
      cartList = _firestoreService.userCartList.toList();
      removeUnavailable();
      generateItem();
      rebuildUi();
    });
    _firestoreService.users
        .doc(uid)
        .collection('Cart')
        .snapshots()
        .listen((querySnapshot) async {
      await _firestoreService.loadCartData(uid!);
      cartList = _firestoreService.userCartList.toList();
      removeUnavailable();
      generateItem();
      rebuildUi();
    });
  }

  void removeUnavailable() {
    List<String> itemIds =
        _firestoreService.itemDataList.map((item) => item.id).toList();
    List<Cart> cartCopy = List.from(cartList);

    for (Cart cartItem in cartCopy) {
      if (!(itemIds.contains(cartItem.itemId))) {
        _cartService.deletFromCart(docId: cartItem.itemId, uid: uid as String);
        print("not in items" + cartItem.itemId);
        // make a delete function
        // delte that
      }
    }
  }

  void incrementQuantity(String id) {
    int count = cartItemQuantity(id);
    count = count + 1;
    _cartService.updateCartQuantity(Q: count, docId: id, uid: uid as String);
  }

  void decrimentQuantity(String id) {
    int count = cartItemQuantity(id);
    count = count - 1;
    if (count >= 1) {
      _cartService.updateCartQuantity(Q: count, docId: id, uid: uid as String);
    }
  }

  void deleteitemfromcart(String id, String itemName, BuildContext context) {
    Flushbar(
      // message: "$itemName have been added to your Cart",
      messageText: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemName,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Text(
            "have been removed from your cart",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
          )
        ],
      ),

      icon: const Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.white,
      ),
      duration: const Duration(milliseconds: 900),
      padding: const EdgeInsets.all(9),

      //animationDuration: Duration(milliseconds: 200),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,

      backgroundColor: Colors.red,
    ).show(context);

    _cartService.deletFromCart(docId: id, uid: uid as String);

    rebuildUi();
  }

  int totalprice() {
    int total = 0;
    int price = 0;
    if (cartItemList.isNotEmpty) {
      for (int i = 0; i < cartItemList.length; i++) {
        if (cartitemData(i).isOnSale!) {
          price = cartitemData(i).changedPrice!;
        } else {
          price = cartitemData(i).price;
        }
        int quantity = cartItemQuantity(cartitemData(i).id);
        total = total + (price * quantity);
      }
    } else {
      total = 0;
    }
    return total;
  }

  void checkout() async {
    isLoading = true;
    rebuildUi();
    int totalAmount = totalprice();
    int itemCount = cartList.length;
    print(totalAmount);
    print(itemCount);
    print(cartList.map((e) => e.itemId).toList());
    // if (await _cartService.newOrder(
    //     userId: uid as String, totalAmount: totalAmount, items: cartList)) {
    //   isLoading = false;
    // }
    List<Cart> temp = [];

    for (int i = 0; i < cartItemList.length; i++) {
      temp.add(
        Cart(
          itemId: cartitemData(i).id,
          quantity: cartItemQuantity(cartitemData(i).id),
          name: cartitemData(i).title,
          price: cartitemData(i).changedPrice,
          imageUrl: cartitemData(i).imageUrl,
          isOnSale: cartitemData(i).isOnSale,
        ),
      );
      print(temp[i].itemId);
      print(temp[i].name);
      print(temp[i].price);
      print(temp[i].quantity);
      print(temp[i].imageUrl);
      print(temp[i].isOnSale);
    }
    _tempService.ListOfCartItem.clear();

    _tempService.ListOfCartItem.addAll(temp);
    _tempService.totalPrice = totalprice();

    isLoading = false;
    Userinfo? user = await _firestoreService.getUser(uid!);
    if (user?.address != null) {
      _tempService.getinfo = true;
    } else {
      _tempService.getinfo = false;
    }
    _navService.navigateToCheckoutView();

    // rebuildUi();
    // _bottomSheet.showCustomSheet(
    //   variant: BottomSheetType.notice,
    //   title: "Selected Your Location",
    //   description: 'From the Map',
    // );

    // _bottomSheet.showBottomSheet(title: "Set your Address");
    // Order order = Order(
    //     id: id,
    //     userId: userId,
    //     items: items,
    //     totalAmount: totalAmount,
    //     timestamp: timestamp);
  }
}
