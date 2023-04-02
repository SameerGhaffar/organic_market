// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';

class Sliderimage {
  String? id;
  String? ImageUrl;

  Sliderimage({
    this.id,
    this.ImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': ImageUrl,
    };
  }

  factory Sliderimage.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Sliderimage(
      ImageUrl: map['imageUrl'],
      id: map['id'],
    );
  }
}
