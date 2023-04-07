import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/app/app.router.dart';
import 'package:organic_market/model/category_model.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryAdminModel extends BaseViewModel {
  final _dialogservice = locator<DialogService>();
  final _storagesevice = locator<StorageService>();
  final _firestoreService = locator<FireStoreService>();
  final _bottomsheet = locator<BottomSheetService>();
  final _navigation = locator<NavigationService>();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void additem(String id) {
    _firestoreService.setDocId(id);

    print(id);
    _navigation.navigateToCategoryItemAdmin();
  }

  void onchangedValidation() {
    formKey.currentState!.validate();
    rebuildUi();
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Name Can not be Empty";
    }
    return null;
  }

  final ImagePicker _imagePicker = ImagePicker();

  File? _image;

  File? get image => _image;

  bool isImagePicked = false;

  bool loading = false;
  bool updatedisabled = false;

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

  Future uploadData() async {
    loading = true;
    rebuildUi();
    if (formKey.currentState!.validate()) {
      String name = nameController.text.toString();
      if (await _storagesevice.categoryUploadData(
          categoryName: name, image: _image)) {
        loading = false;
        nameController.clear();
        rebuildUi();
      }
      isImagePicked = false;
      _image = null;
      rebuildUi();
    } else {
      loading = false;
    }
  }

  Future updateData({required String id, required String imageUrl}) async {
    String name = nameController.text.toString();

    _dialogservice.showDialog(title: "Uploading");

    if (await _storagesevice.categoryUpdateData(
        id: id, categoryName: name, image: _image, imageUrl: imageUrl)) {
      isImagePicked = false;
      _image = null;
      nameController.clear();

      rebuildUi();
      _dialogservice.completeDialog(DialogResponse(confirmed: true));
    }
  }

  List<ProductCategory> datalist() {
    return _firestoreService.categoryDataList;
  }

  Future fetchData() async {
    _firestoreService.productcategorysRef.snapshots().listen((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docChanges.forEach((doc) async {
        if (doc.type == DocumentChangeType.removed) {
          await _firestoreService.loadCategoryData();
          rebuildUi();
        }
        if (doc.type == DocumentChangeType.added) {
          await _firestoreService.loadCategoryData();
          rebuildUi();
        }
        if (doc.type == DocumentChangeType.modified) {
          await _firestoreService.loadCategoryData();
          rebuildUi();
        }
      });
    });
    // await _firestoreService.loadCategoryData();
    // rebuildUi();
  }

  Future deleteData({String? imageUrl, required String docId}) async {
    _firestoreService.setDocId(docId);
    _firestoreService.loadItemData();
    _firestoreService.generateItem(docId);
    if (_firestoreService.selecteditemList.isNotEmpty) {
      _dialogservice.showDialog(
          title: "Opps Cant Delete",
          description: "Category Has Items First delete Them",
          buttonTitle: "Ok");

      return;
    }
    var sheetResponse = await _bottomsheet.showBottomSheet(
      title: "Delete",
      description: "Selected Image will be deleted",
      confirmButtonTitle: "Delete",
    );
    if (sheetResponse != null) {
      if (sheetResponse.confirmed) {
        print("delete");
        try {
          await _storagesevice.categoryDeleteData(imageUrl!, docId);
        } catch (e) {
          _dialogservice.showDialog(title: "Opps", description: e.toString());
        }

        rebuildUi();
      } else {
        print("sheet responnse false");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
}
