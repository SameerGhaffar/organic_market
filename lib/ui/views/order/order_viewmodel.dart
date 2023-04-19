import 'package:firebase_auth/firebase_auth.dart';
import 'package:organic_market/model/order_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OrderViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();
  final _authService = locator<AuthService>();

  List<OrderModel> orderList = [];

  OrderModel orderData(int index) {
    return orderList.map((e) => e).toList()[index];
  }

  Future fetchData() async {
    _firestoreService.orderRef.snapshots().listen((querySnapshot) async {
      await _firestoreService.loadOrderData();

      orderList = _firestoreService.orderDataList
          .where((element) => element.userId == _authService.userId())
          .toList();

      rebuildUi();
    });
  }
}
