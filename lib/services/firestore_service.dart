import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_market/model/promotion_model.dart';
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

  final CollectionReference SliderimagesRef =
      FirebaseFirestore.instance.collection('SliderImages');
  final CollectionReference PromotionimagesRef =
      FirebaseFirestore.instance.collection('PromotionImages');

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

// getting list of slider data
  List<Sliderimage> sliderDataList = [];

  loadSliderImage() async {
    try {
      await SliderimagesRef.get().then((value) {
        sliderDataList = List.generate(
          value.size,
          (index) => Sliderimage.fromMap(
              value.docs[index] as DocumentSnapshot<Map<String, dynamic>>),
        );
      });
      print('Success');
    } catch (e) {
      print('Failed: ' + e.toString());
    }
  }

// getting list of promotion data
  List<PromotionImage> promotionDataList = [];

  loadPromotionImage() async {
    try {
      await PromotionimagesRef.get().then((value) {
        promotionDataList = List.generate(
          value.size,
          (index) => PromotionImage.fromMap(
              value.docs[index] as DocumentSnapshot<Map<String, dynamic>>),
        );
      });
      print('Success');
    } catch (e) {
      print('Failed: ' + e.toString());
    }
  }
}
