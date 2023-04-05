// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategory {
  final String? id;
  final String? imageUrl;
  final String? name;

  ProductCategory({
    this.id,
    this.imageUrl,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
    };
  }

  factory ProductCategory.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return ProductCategory(
        imageUrl: map['imageUrl'], id: map['id'], name: map['name']);
  }
}
