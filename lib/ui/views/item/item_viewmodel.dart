import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/category_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ItemViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();

  addToCart(int index) {
    print("index = $index");
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
}
