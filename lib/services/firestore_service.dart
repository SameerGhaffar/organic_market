import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_market/model/user.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  CollectionReference get users => _users;

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
}
