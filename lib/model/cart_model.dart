// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  final String itemId;
  final int quantity;
  String? name;
  int? price;
  String? imageUrl;
  bool? isOnSale;

  Cart({
    required this.itemId,
    required this.quantity,
    this.name,
    this.price,
    this.imageUrl,
    this.isOnSale,
  });

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'itemId': itemId,
      'price': price,
      'name': name,
      'imageUrl': imageUrl,
      'isOnSale': isOnSale
    };
  }

  factory Cart.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Cart(
        quantity: map['quantity'],
        itemId: map['itemId'],
        name: map['name'],
        price: map['price'],
        imageUrl: map['imageUrl'],
        isOnSale: map['isOnSale']);
  }
}
