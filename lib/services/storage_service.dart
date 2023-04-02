import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/services/firestore_service.dart';

class StorageService {
  final _firestoreService = locator<FireStoreService>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseStorage get storage => _storage;

  final Reference imagesRef = FirebaseStorage.instance.ref("SliderImages/");

  Future<bool> uploadimage(File? image) async {
    if (image != null) {
      final UploadTask uploadTask = imagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef = _firestoreService.imagesRef.doc();
      final String docId = docRef.id;
      final Sliderimage imageObj = Sliderimage(ImageUrl: url, id: docId);

      await docRef.set(imageObj.toMap());

      return true;
    }

    return false;
  }

  Future<bool> deleteImage(String imageUrl, String docId) async {
    // Delete image from Firebase Storage
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();

    // Delete document from Firestore collection
    await _firestoreService.imagesRef.doc(docId).delete();

    return true;
  }
}
