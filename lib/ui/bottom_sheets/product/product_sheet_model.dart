import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/cart_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ProductSheetModel extends ReactiveViewModel {
  final _firestoreService = locator<FireStoreService>();

  final _authService = locator<AuthService>();
  final _cartService = locator<CartService>();

  List<ListenableServiceMixin> get listenableService => [_firestoreService];

  bool? sale;
  Item item() {
    return _firestoreService.item as Item;
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
}
