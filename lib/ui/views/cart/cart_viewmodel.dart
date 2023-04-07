import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/cart_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();
  final _authService = locator<AuthService>();
  final _storageService = locator<StorageService>();

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
        _storageService.deletFromCart(
            docId: cartItem.itemId, uid: uid as String);
        print("not in items" + cartItem.itemId);
        // make a delete function
        // delte that
      }
    }
  }

  void incrementQuantity(String id) {
    int count = cartItemQuantity(id);
    count = count + 1;
    _storageService.updateCartQuantity(Q: count, docId: id, uid: uid as String);
  }

  void decrimentQuantity(String id) {
    int count = cartItemQuantity(id);
    count = count - 1;
    if (count >= 1) {
      _storageService.updateCartQuantity(
          Q: count, docId: id, uid: uid as String);
    }
  }

  void deleteitemfromcart(String id) {
    _storageService.deletFromCart(docId: id, uid: uid as String);
    rebuildUi();
  }

  int totalprice() {
    int total = 0;
    if (cartItemList.isNotEmpty) {
      for (int i = 0; i < cartItemList.length; i++) {
        int price = cartitemData(i).price;
        int quantity = cartItemQuantity(cartitemData(i).id);
        total = total + (price * quantity);
      }
    } else {
      total = 0;
    }
    return total;
  }

  void checkout() {}
}
