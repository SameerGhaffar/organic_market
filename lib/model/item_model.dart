import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String? id;
  String? imageUrl;
  String? name;

  Item({
    this.id,
    this.imageUrl,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  factory Item.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Item(
      imageUrl: map['imageUrl'],
      id: map['id'],
    );
  }
}
