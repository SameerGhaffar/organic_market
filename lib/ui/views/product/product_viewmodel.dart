import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';

class ProductViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();
  final _storagesevice = locator<StorageService>();
  final _authService = locator<AuthService>();
  TextEditingController searchController = TextEditingController();
  bool show = false;
  keyboardDismiss(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Item searchdata(int index) {
    return searchList.map((e) => e).toList()[index];
  }

  List<Item> searchList = [];
  onChanged() {
    if (searchController.text.toString().isNotEmpty) {
      show = true;
      String searchText = searchController.text.toString().toLowerCase();
      searchList = itemList
          .where((item) => item.title.toLowerCase().contains(searchText))
          .toList();
      searchList.sort((a, b) => a.title.compareTo(b.title));

      //_firestoreService.itemDataList
      // .where((item) =>
      //     cartList.map((cart) => cart.itemId).toList().contains(item.id))
      // .toList();
      rebuildUi();
    } else {
      show = false;
      rebuildUi();
    }
  }

  List<Item> itemList = [];

  Item itemdata(int index) {
    return itemList.map((e) => e).toList()[index];
  }

  Future fetchData() async {
    _firestoreService.itemRef.snapshots().listen((querySnapshot) async {
      await _firestoreService.loadItemData();
      itemList = _firestoreService.itemDataList.toList();

      rebuildUi();
    });
  }

  addToCart(String itemId, String itemName, BuildContext context) {
    _storagesevice.addToCart(
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
}
