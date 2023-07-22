import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_market/app/app.locator.dart';

import 'package:organic_market/model/cart_model.dart';
import 'package:organic_market/model/order_model.dart';
import 'package:organic_market/services/firestore_service.dart';

class CartService {
  final _firestoreService = locator<FireStoreService>();

  Future<bool> addToCart(
      {required String uid,
      required String itemId,
      required int quantity}) async {
    try {
      final DocumentReference docRef =
          _firestoreService.getCartItemRef(uid: uid, itemId: itemId);

      docRef.get().then((DocumentSnapshot snapshot) async {
        if (snapshot.exists) {
          try {
            Cart cartitem = Cart.fromMap(
                snapshot as DocumentSnapshot<Map<String, dynamic>>);

            int q = cartitem.quantity + quantity;

            await docRef.update({
              'quantity': q,
            });
            print("Update");
          } catch (e) {
            print(e);
          }
        } else {
          final Cart dataobj = Cart(quantity: quantity, itemId: itemId);
          await docRef.set(dataobj.toMap());
          print("Create");
        }
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletFromCart(
      {required String docId, required String uid}) async {
    // Delete document from Firestore collection

    final DocumentReference docRef =
        _firestoreService.getCartItemRef(uid: uid, itemId: docId);
    docRef.delete();

    return true;
  }

  Future<bool> newOrder({
    required String userId,
    required int totalAmount,
    required List<Cart> items,
  }) async {
    try {
      final random = Random();
      final datatime = DateTime.now();
      final orderId =
          '#${datatime.millisecond}${random.nextInt(999999)}${datatime.millisecond}'
              .padLeft(7, '0');
      final DocumentReference docRef = _firestoreService.orderRef.doc(orderId);
      final String docId = docRef.id;

      OrderModel orderObj = OrderModel(
        id: docId,
        userId: userId,
        totalAmount: totalAmount,
        timestamp: datatime,
        isCompleted: false,
        items: items,
      );
      await docRef.set(orderObj.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateCartQuantity(
      {required String docId, required String uid, required int Q}) async {
    final DocumentReference docRef =
        _firestoreService.getCartItemRef(uid: uid, itemId: docId);
    await docRef.update({
      'quantity': Q,
    });

    return true;
  }
}
