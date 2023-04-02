import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/slider.dart';
import 'package:organic_market/services/firestore_service.dart';

class StorageService {
  final _firestoreService = locator<FireStoreService>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseStorage get storage => _storage;

  final Reference imagesRef = FirebaseStorage.instance.ref("images/");

  Future<bool> uploadimage(File? image) async {
    if (image != null) {
      final UploadTask uploadTask = imagesRef
          .child(DateTime.now().toIso8601String())
          .putFile(image.absolute);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      final String url = (await downloadUrl.ref.getDownloadURL());
      _firestoreService.imagesRef.add(Sliderimage().toMap(url));

      return true;
    }

    return false;
  }
}
