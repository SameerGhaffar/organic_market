import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/services/manager.dart';
import 'package:stacked/stacked.dart';

class ItemViewModel extends BaseViewModel {
  final _firestoreService = locator<FireStoreService>();
  final _storagesevice = locator<StorageService>();
  final _authService = locator<AuthService>();

  addToCart(String itemId) {
    _storagesevice.addToCart(
        itemId: itemId, quantity: 1, uid: _authService.auth.currentUser!.uid);
    print("itemId = $itemId");
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
