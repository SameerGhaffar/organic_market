import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryItemAdminModel extends BaseViewModel {
  final _dialogservice = locator<DialogService>();
  final _storagesevice = locator<StorageService>();
  final _firestoreService = locator<FireStoreService>();
  final _bottomsheet = locator<BottomSheetService>();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void additem() {}

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
      String title = titleController.text.toString();
      int quantity = int.parse(quantityController.text.toString());
      String type = quantityTypeController.text.toString();
      int price = int.parse(priceController.text.toString());

      if (await _storagesevice.itemUploadData(
          image: _image as File,
          itemTitle: title,
          quantity: quantity,
          qType: type,
          price: price)) {
        loading = false;
        titleController.clear();
        quantityController.clear();
        quantityTypeController.clear();
        priceController.clear();
        rebuildUi();
        // fetchData();
      }
      isImagePicked = false;
      _image = null;
      rebuildUi();
    } else {
      loading = false;
    }
  }

  List<Item> itemList = [];
  Item itemdata(int index) {
    return itemList.map((e) => e).toList()[index];
  }

  Future fetchData() async {
    _firestoreService.itemRef.snapshots().listen((querySnapshot) async {
      await _firestoreService.loadItemData();
      itemList = _firestoreService.itemDataList
          .where(
              (element) => element.categoryId == _firestoreService.categoryid)
          .toList();

      rebuildUi();

      // await _firestoreService.loadCategoryData();
      // rebuildUi();
    });
  }

  Future updateData({required String id, required String imageUrl}) async {
    String title = titleController.text.toString();
    String q = quantityController.text.toString();
    int? quantity = q.isEmpty ? null : int.parse(q);
    String type = quantityTypeController.text.toString();
    String p = priceController.text.toString();
    int? price = p.isEmpty ? null : int.parse(p);

    _dialogservice.showDialog(title: "Uploading");

    if (await _storagesevice.itemUpdateData(
        id: id,
        imageUrl: imageUrl,
        itemTitle: title,
        quantity: quantity,
        qType: type,
        price: price,
        image: _image)) {
      loading = false;
      isImagePicked = false;
      titleController.clear();
      quantityController.clear();
      quantityTypeController.clear();
      priceController.clear();
      rebuildUi();
      _dialogservice.completeDialog(DialogResponse(confirmed: true));
    }
  }

  Future deleteItem({String? imageUrl, String? docId}) async {
    var sheetResponse = await _bottomsheet.showBottomSheet(
      title: "Delete",
      description: "Selected Image will be deleted",
      confirmButtonTitle: "Delete",
    );
    if (sheetResponse != null) {
      if (sheetResponse.confirmed) {
        print("delete");
        try {
          await _storagesevice.itemDeleteData(imageUrl!, docId!);
        } catch (e) {
          _dialogservice.showDialog(title: "Opps", description: e.toString());
        }

        rebuildUi();
      } else {
        print("sheet responnse false");
      }
    }
  }

  String? titleValidator(String? value) {
    if (value!.isEmpty) {
      return "Item must has a title";
    } else if (value.length > 10) {
      return "Title Must be Short";
    }

    return null;
  }

  String? qunatityValidator(String? value) {
    if (value!.isEmpty) {
      return "Item must has a quantity";
    }
    return null;
  }

  String? quantityTypeValidator(String? value) {
    if (value!.isEmpty) {
      return "Type Should not Empty";
    }
    return null;
  }

  String? priceValidator(String? value) {
    if (value!.isEmpty) {
      return "Item Must has a price";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    quantityController.dispose();
    quantityTypeController.dispose();
    priceController.dispose();
  }
}
