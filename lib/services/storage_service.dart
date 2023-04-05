import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/category_model.dart';
import 'package:organic_market/model/promotion_model.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/services/firestore_service.dart';

class StorageService {
  final _firestoreService = locator<FireStoreService>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseStorage get storage => _storage;

  final Reference sliderimagesRef =
      FirebaseStorage.instance.ref("SliderImages");
  final Reference promotionImageRef =
      FirebaseStorage.instance.ref("PromotionImages");
  final Reference categoryImagesRef =
      FirebaseStorage.instance.ref("CategoryImages");
  final Reference itemImagesRef = FirebaseStorage.instance.ref("ItemImages");

// Slider images Upload and delete tool used by the admin
  Future<bool> sliderUploadImage(File? image) async {
    if (image != null) {
      final UploadTask uploadTask = sliderimagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef = _firestoreService.sliderImagesRef.doc();
      final String docId = docRef.id;
      final Sliderimage imageObj = Sliderimage(ImageUrl: url, id: docId);

      await docRef.set(imageObj.toMap());

      return true;
    }

    return false;
  }

  Future<bool> sliderDeleteImage(String imageUrl, String docId) async {
    // Delete image from Firebase Storage
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();

    // Delete document from Firestore collection
    await _firestoreService.sliderImagesRef.doc(docId).delete();

    return true;
  }

// Promotion image tool
  Future<bool> uploadPromotionImage(File? image) async {
    if (image != null) {
      final UploadTask uploadTask = promotionImageRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef =
          _firestoreService.promotionImagesRef.doc();
      final String docId = docRef.id;
      final PromotionImage imageObj = PromotionImage(ImageUrl: url, id: docId);

      await docRef.set(imageObj.toMap());

      return true;
    }

    return false;
  }

  Future<bool> promotionDeleteImage(String imageUrl, String docId) async {
    // Delete image from Firebase Storage
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();

    // Delete document from Firestore collection
    await _firestoreService.promotionImagesRef.doc(docId).delete();

    return true;
  }

  //Category
  Future<bool> categoryUploadData({File? image, String? categoryName}) async {
    if (image != null) {
      final UploadTask uploadTask = categoryImagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef =
          _firestoreService.productcategorysRef.doc();
      final String docId = docRef.id;
      final ProductCategory dataobj =
          ProductCategory(name: categoryName, imageUrl: url, id: docId);

      await docRef.set(dataobj.toMap());

      return true;
    }

    return false;
  }

  Future<bool> categoryUpdateData(
      {File? image,
      String? categoryName,
      required String id,
      required String imageUrl}) async {
    if (image != null && categoryName != null) {
      // delete image that is stored and upload new also name
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();

      final UploadTask uploadTask = categoryImagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);

      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});

      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef =
          _firestoreService.productcategorysRef.doc(id);

      await docRef.update({
        'imageUrl': url,
        'name': categoryName,
      });

      return true;
    } else if (image != null && categoryName == null) {
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();

      final UploadTask uploadTask = categoryImagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);

      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});

      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef =
          _firestoreService.productcategorysRef.doc(id);

      await docRef.update({
        'imageUrl': url,
      });

      return true;

      // delete image upload image
    } else if (categoryName != null && image == null) {
      if (categoryName.isNotEmpty) {
        final DocumentReference docRef =
            _firestoreService.productcategorysRef.doc(id);

        await docRef.update({
          'name': categoryName,
        });
      }
      // only update name

      return true;
    } else {
      return false;
    }
  }

  Future<bool> categoryDeleteData(String imageUrl, String docId) async {
    // Delete image from Firebase Storage
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();

    // Delete document from Firestore collection
    await _firestoreService.productcategorysRef.doc(docId).delete();

    return true;
  }
}
