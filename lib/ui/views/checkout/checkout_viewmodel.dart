import 'package:flutter/material.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/model/user.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/cart_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/tempdata_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../model/cart_model.dart';

class CheckoutViewModel extends BaseViewModel {
  // service
  final _cartdataService = locator<TempdataService>();
  final _firestore = locator<FireStoreService>();
  final _auth = locator<AuthService>();
  final _cartService = locator<CartService>();
  final _navService = locator<NavigationService>();

  // controllers
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  // key
  final addressFormKey = GlobalKey<FormState>();

//

  bool isloading = false;
  String address = "";
  bool? getInfo;

  onChanged() {
    addressFormKey.currentState?.validate();
  }

  List<Cart> cartList = [];

  Cart cartitemData(int index) {
    return cartList.map((e) => e).toList()[index];
  }

  int totalprice() {
    return _cartdataService.totalPrice;
  }

  Userinfo? user;
  String? uid;
  Future fetchData() async {
    getInfo = _cartdataService.getinfo;
    cartList = _cartdataService.ListOfCartItem;
    uid = await _auth.auth.currentUser!.uid;
    user = await _firestore.getUser(uid!);
    if (user?.address != null) {
      address = user!.address!; // Add the null check using '!'
    }

    rebuildUi();
  }

  updateAddress() {
    if (addressFormKey.currentState!.validate()) {
      address = addressController.text.toString();
      address = address + " " + cityController.text.toString();
      String uid = _auth.userId();
      _firestore.updateaddress(uid, address);
      rebuildUi();
    }
  }

  next() {
    getInfo = !getInfo!;
    rebuildUi();
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter  Address ";
    } else if (value.length < 5) {
      return 'Provide Complete address';
    }
    return null;
  }

  String? cityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter  City ";
    } else if (value.length < 2) {
      return 'invalid City';
    }
    return null;
  }

  confirmOrder(BuildContext context) async {
    isloading = true;
    rebuildUi();
    if (await _cartService.newOrder(
      address: address,
      items: cartList,
      paymentMethod: "Cash On Delivery",
      totalAmount: totalprice(),
      userId: uid!,
    )) {
      isloading = false;
      print('Order placed');
      rebuildUi();
      await _cartService.deleteCartDocument(uid: uid!)
          ? print('cart deleted')
          : print('Error');
      _navService.replaceWithOrdercompletedView();
    } else {
      print("order not created");
    }
  }

  ok() {
    print('ok pressed');
  }

  @override
  void dispose() {
    super.dispose();

    addressController.dispose();
    cityController.dispose();
  }
}
