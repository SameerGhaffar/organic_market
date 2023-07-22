import 'package:stacked/stacked.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/app/app.bottomsheets.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/cart_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/cart_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:another_flushbar/flushbar.dart';

class ProductViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();
  final _authService = locator<AuthService>();
  final _navigation = locator<NavigationService>();
  final _indexservice = locator<NavDrawerindexService>();

  final _cartService = locator<CartService>();
  final _bottomService = locator<BottomSheetService>();
  cartPage() {
    print("back Preseed");
    _indexservice.setIndex = 2;
    print("index =${_indexservice.selctedindex}");
    _navigation.back();
  }

  addToCart(String itemId, String itemName, BuildContext context) {
    _cartService.addToCart(
        itemId: itemId, quantity: 1, uid: _authService.auth.currentUser!.uid);

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
            "have been added to your cart",
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

      backgroundColor: Colors.green,
    ).show(context);

    print("itemId = $itemId");
  }

  List<Item> itemList = [];

  Item itemdata(int index) {
    return itemList.map((e) => e).toList()[index];
  }

  // List<ProductCategory> item = [];
  int total = 0;
  Future fetchData() async {
    _firestoreService.itemRef.snapshots().listen((querySnapshot) async {
      itemList = _firestoreService.itemDataList.toList();
      rebuildUi();
      // await _firestoreService.loadCategoryData();
      // rebuildUi();
    });
    var uid = _authService.auth.currentUser!.uid;
    _firestoreService.users
        .doc(uid)
        .collection('Cart')
        .snapshots()
        .listen((querySnapshot) async {
      await _firestoreService.loadCartData(uid);
      List<Cart> cartList = _firestoreService.userCartList.toList();
      if (cartList.isNotEmpty) {
        total = cartList
            .map((e) => e.quantity)
            .toList()
            .reduce((total, quantity) => total + quantity);
        rebuildUi();
      } else {
        total = 0;
      }
    });
  }

  int totalquantity() {
    return total;
  }

  openProductSheet(Item item) {
    _firestoreService.setItem(item);
    _bottomService.showCustomSheet(variant: BottomSheetType.product);
    //_navigation.navigateToView(ProductView());
  }
}
