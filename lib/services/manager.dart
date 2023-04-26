import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:organic_market/app/app.locator.dart';

import 'package:organic_market/model/cart_model.dart';
import 'package:organic_market/model/category_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/model/order_model.dart';
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
    try {
      if (image != null) {
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
        });
      }
      if (categoryName != null && categoryName.isNotEmpty) {
        final DocumentReference docRef =
            _firestoreService.productcategorysRef.doc(id);

        await docRef.update({
          'name': categoryName,
        }); // delete image upload image
      }
      return true;
    } catch (e) {
      print("error in update data $e");
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

  // item upload

  Future<bool> itemUploadData(
      {required File image,
      required String itemTitle,
      required int quantity,
      required String qType,
      required int price}) async {
    try {
      final UploadTask uploadTask = itemImagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      final String url = (await downloadUrl.ref.getDownloadURL());
      final DocumentReference docRef = _firestoreService.itemRef.doc();
      final String docId = docRef.id;
      String categoryId = _firestoreService.categoryid;
      final Item dataobj = Item(
          categoryId: categoryId,
          imageUrl: url,
          id: docId,
          price: price,
          quantity: quantity,
          quantityType: qType,
          title: itemTitle);

      await docRef.set(dataobj.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> itemDeleteData(String imageUrl, String docId) async {
    // Delete image from Firebase Storage
    await FirebaseStorage.instance.refFromURL(imageUrl).delete();

    // Delete document from Firestore collection
    await _firestoreService.itemRef.doc(docId).delete();

    return true;
  }

  Future<bool> itemUpdateData(
      {required String id,
      required String imageUrl,
      required File? image,
      required String? itemTitle,
      required int? quantity,
      required String? qType,
      required int? price}) async {
    final DocumentReference docRef = _firestoreService.itemRef.doc(id);

    try {
      if (image != null) {
        final UploadTask uploadTask = categoryImagesRef
            .child(DateTime.now().toIso8601String())
            .putFile(image.absolute);
        final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
        final String url = (await downloadUrl.ref.getDownloadURL());
        if (url.isNotEmpty) {
          await FirebaseStorage.instance.refFromURL(imageUrl).delete();
          await docRef.update({
            'imageUrl': url,
          });
        }
      }
      if (itemTitle != null && itemTitle.isNotEmpty) {
        await docRef.update({
          'title': itemTitle,
        });
      }
      if (quantity != null) {
        await docRef.update({
          'quantity': quantity,
        });
      }
      if (qType != null && qType.isNotEmpty) {
        await docRef.update({
          'quantityType': qType,
        });
      }
      if (price != null) {
        await docRef.update({
          'price': price,
        });
      }

      return true;
    } catch (e) {
      print("item update fail $e");
      return false;
    }
  }

  Future<bool> addToCart({
    required String uid,
    required String itemId,
    required int quantity,
  }) async {
    try {
      final DocumentReference docRef =
          _firestoreService.users.doc(uid).collection("Cart").doc(itemId);

      docRef.get().then((DocumentSnapshot snapshot) async {
        if (snapshot.exists) {
          try {
            Cart cartitem = Cart.fromMap(
                snapshot as DocumentSnapshot<Map<String, dynamic>>);

            int q = cartitem.quantity + quantity;

            await docRef.update({
              'quantity': q,
            });
            print("Update");
          } catch (e) {
            print(e);
          }
        } else {
          final Cart dataobj = Cart(quantity: quantity, itemId: itemId);
          await docRef.set(dataobj.toMap());
          print("Create");
        }
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletFromCart(
      {required String docId, required String uid}) async {
    // Delete document from Firestore collection

    await _firestoreService.users
        .doc(uid)
        .collection("Cart")
        .doc(docId)
        .delete();

    return true;
  }

  Future<bool> updateCartQuantity(
      {required String docId, required String uid, required int Q}) async {
    final DocumentReference docRef =
        _firestoreService.users.doc(uid).collection("Cart").doc(docId);
    await docRef.update({
      'quantity': Q,
    });

    return true;
  }

  //
  //Order
  Future<bool> newOrder({
    required String userId,
    required int totalAmount,
    required List<Cart> items,
  }) async {
    try {
      final random = Random();
      final datatime = DateTime.now();
      final orderId =
          '#${datatime.millisecond}${random.nextInt(999999)}${datatime.millisecond}'
              .padLeft(7, '0');
      final DocumentReference docRef = _firestoreService.orderRef.doc(orderId);
      final String docId = docRef.id;

      OrderModel orderObj = OrderModel(
        id: docId,
        userId: userId,
        totalAmount: totalAmount,
        timestamp: datatime,
        isCompleted: false,
        items: items,
      );
      await docRef.set(orderObj.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }
}
