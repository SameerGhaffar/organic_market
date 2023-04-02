import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/model/user.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  CollectionReference get users => _users;
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference get categories => _categories;

  final CollectionReference imagesRef =
      FirebaseFirestore.instance.collection('SliderImages');

  String? error;

  _error(String? e) {
    error = e;
  }

  Future createUser(Userinfo user) async {
    try {
      await _users.doc(user.id).set(user.toMap());
    } catch (e) {
      _error(e as String?);
    }
  }

  Future getUser(String uid) async {
    try {
      var userdata = await _users.doc(uid).get();
      return Userinfo.fromMap(userdata.data as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  List<Sliderimage> item = [];

  loadSliderImage() async {
    try {
      await FirebaseFirestore.instance
          .collection('SliderImages')
          .get()
          .then((value) {
        item = List.generate(
          value.size,
          (index) => Sliderimage.fromMap(value.docs[index]),
        );
      });
      print('Success');
    } catch (e) {
      print('Failed: ' + e.toString());
    }
  }
}
