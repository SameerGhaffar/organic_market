// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  final String itemId;
  final int quantity;

  Cart({
    required this.itemId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'itemId': itemId,
    };
  }

  factory Cart.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Cart(quantity: map['quantity'], itemId: map['itemId']);
  }
}
