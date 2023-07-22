// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final bool? isOnSale;
  final int? changedPrice;
  final String categoryId;
  final String imageUrl;
  final String title;
  final String description;
  final int quantity;
  final int price;
  final String quantityType;

  Item({
    required this.id,
    this.isOnSale,
    this.changedPrice,
    required this.categoryId,
    required this.imageUrl,
    required this.title,
    required this.description,
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
      'description': description,
      'quantity': quantity,
      'quantityType': quantityType,
      'price': price,
      'changedPrice': changedPrice,
      'isOnSale': isOnSale,
    };
  }

  factory Item.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Item(
      id: map['id'],
      isOnSale: map['isOnSale'],
      changedPrice: map['changedPrice'],
      categoryId: map['categoryId'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      description: map['description'],
      quantity: map['quantity'],
      price: map['price'],
      quantityType: map['quantityType'],
    );
  }
}
