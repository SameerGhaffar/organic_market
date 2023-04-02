import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PromotionAdminModel extends BaseViewModel {
  final _dialogservice = locator<DialogService>();
  final _storagesevice = locator<StorageService>();
  final _firestoreService = locator<FireStoreService>();
  final _bottomsheet = locator<BottomSheetService>();

  final ImagePicker _imagePicker = ImagePicker();

  File? _image;

  File? get image => _image;

  bool isImagePicked = false;

  bool loading = false;

  Future imagepick() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        isImagePicked = true;
      } else {
        _image = null;
        isImagePicked = false;
      }
    } on PlatformException catch (e) {
      isImagePicked = false;
      _dialogservice.showDialog(
          title: "Opps",
          description: e.message.toString(),
          buttonTitle: "OK",
          buttonTitleColor: Colors.black);
    }

    rebuildUi();
  }

  Future uploadimage() async {
    loading = true;
    rebuildUi();
    if (await _storagesevice.uploadimage(_image)) {
      loading = false;
      fetchpost();
    }
    isImagePicked = false;
    _image = null;
    rebuildUi();
  }

/*.imagelist()
                                          .map((sliderobject) =>
                                              sliderobject.ImageUrl as String)
                                          .toList()[index] */
  List<Sliderimage> imagelist() {
    return _firestoreService.item;
  }

  Future fetchpost() async {
    await _firestoreService.loadSliderImage();
    rebuildUi();
  }

  Future deleteimage(String imageUrl, String docId) async {
    var sheetResponse = await _bottomsheet.showBottomSheet(
      title: "Delete",
      description: "Selected Image will be deleted",
      confirmButtonTitle: "Delete",
    );
    if (sheetResponse != null) {
      if (sheetResponse.confirmed) {
        print("delete");
        try {
          _storagesevice.deleteImage(imageUrl, docId);
        } catch (e) {
          _dialogservice.showDialog(title: "Opps", description: e.toString());
        }

        fetchpost();
        rebuildUi();
      } else {
        print("nothing");
      }
    }
  }
}
