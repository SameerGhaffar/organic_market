// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String categoryId;
  final String imageUrl;
  final String title;
  final int quantity;
  final int price;
  final String quantityType;

  Item({
    required this.id,
    required this.categoryId,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.price,
    required this.quantityType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'imageUrl': imageUrl,
      'title': title,
      'quantity': quantity,
      'quantityType': quantityType,
      'price': price,
    };
  }

  factory Item.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Item(
      id: map['id'],
      categoryId: map['categoryId'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      quantity: map['quantity'],
      price: map['price'],
      quantityType: map['quantityType'],
    );
  }
}
