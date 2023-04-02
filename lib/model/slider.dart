// ignore_for_file: file_names, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';

class Sliderimage {
  String? Image;

  Sliderimage({
    this.Image,
  });

  Map<String, dynamic> toMap(String url) {
    return {
      'imageUrl': url,
    };
  }

  factory Sliderimage.fromMap(DocumentSnapshot<Map<String, dynamic>> snap) {
    Map<String, dynamic> map = snap.data()!;
    return Sliderimage(
      Image: map['imageUrl'],
    );
  }
}
