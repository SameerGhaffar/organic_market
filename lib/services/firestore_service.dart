import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organic_market/model/cart_model.dart';
import 'package:organic_market/model/category_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/model/order_model.dart';
import 'package:organic_market/model/promotion_model.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/model/user.dart';
import 'package:stacked/stacked.dart';

class FireStoreService with ListenableServiceMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  CollectionReference get users => _users;
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference get categories => _categories;

  final CollectionReference sliderImagesRef =
      FirebaseFirestore.instance.collection('SliderImages');
  final CollectionReference promotionImagesRef =
      FirebaseFirestore.instance.collection('PromotionImages');
  final CollectionReference productcategorysRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference itemRef =
      FirebaseFirestore.instance.collection('Items');
  final CollectionReference orderRef =
      FirebaseFirestore.instance.collection('Order');

  Item? item;
  setItem(Item i) {
    item = i;
    notifyListeners();
  }

  DocumentReference<Object?> getCartItemRef({
    required String uid,
    required String itemId,
  }) {
    DocumentReference docRef = users.doc(uid).collection("Cart").doc(itemId);
    return docRef;
  }

  Future<Userinfo?> getUserWithEmail(String email) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    final documents = result.docs;
    if (documents.isEmpty) return null;
    return Userinfo.fromMap(documents.first.data());
  }

  String _categoryName = "";

  String get categoryName => _categoryName;

  void setDocName(String name) {
    _categoryName = name;
  }

  String _categoryid = "";

  String get categoryid => _categoryid;

  void setDocId(String id) {
    _categoryid = id;
  }

  String? error;

  _error(String? e) {
    error = e;
  }

  Future createUser(Userinfo user) async {
    try {
      await _users.doc(user.id).set(user.toMap(), SetOptions(merge: true));
    } catch (e) {
      _error(e as String?);
    }
  }

  Future<void> updateaddress(String userId, String address) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      if (snapshot.exists) {
        Map<String, dynamic> userData = snapshot.data()!;
        userData['address'] = address;
        await _users.doc(userId).set(userData, SetOptions(merge: true));
      } else {
        // Document does not exist, handle accordingly
        // For example, you might want to create a new document for the user here
      }
    } catch (e) {
      _error(e.toString());
    }
  }

  Future getUser(String uid) async {
    try {
      var userdata = await _users.doc(uid).get();
      return Userinfo.fromMap(userdata.data() as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

// getting list of slider data
  List<Sliderimage> sliderDataList = [];

  loadSliderImage() async {
    try {
      await sliderImagesRef.get().then((value) {
        sliderDataList = List.generate(
          value.size,
          (index) => Sliderimage.fromMap(
              value.docs[index] as DocumentSnapshot<Map<String, dynamic>>),
        );
      });
      print('Success Slider image are in list ');
    } catch (e) {
      print('Slider images Failed: ' + e.toString());
    }
  }

// getting list of promotion data
  List<PromotionImage> promotionDataList = [];

  loadPromotionImage() async {
    try {
      await promotionImagesRef.get().then((value) {
        promotionDataList = List.generate(
          value.size,
          (index) => PromotionImage.fromMap(
              value.docs[index] as DocumentSnapshot<Map<String, dynamic>>),
        );
      });
      print('Success Promotion images in list ');
    } catch (e) {
      print('Failed: promotion images' + e.toString());
    }
  }

  // catgory
  List<ProductCategory> categoryDataList = [];

  loadCategoryData() async {
    try {
      await productcategorysRef.get().then((value) {
        categoryDataList = List.generate(
          value.size,
          (index) => ProductCategory.fromMap(
              value.docs[index] as DocumentSnapshot<Map<String, dynamic>>),
        );
      });
      print('Category slider list is done ');
      print(categoryDataList.length);
    } catch (e) {
      print('Failed: category list ' + e.toString());
    }
  }

  // item get

  List<Item> itemDataList = [];

  loadItemData() async {
    try {
      await itemRef.get().then((value) {
        itemDataList = List.generate(
          value.size,
          (index) => Item.fromMap(
              value.docs[index] as DocumentSnapshot<Map<String, dynamic>>),
        );
      });
      print('Category item list is done ');
      print(itemDataList.length);
    } catch (e) {
      print('Failed: ' + e.toString());
    }
  }

  List<Item> selecteditemList = [];
  generateItem(String check) {
    selecteditemList =
        itemDataList.where((element) => element.categoryId == check).toList();
  }

  Item itemdata(int index) {
    return selecteditemList.map((e) => e).toList()[index];
  }

  List<Cart> userCartList = [];

  loadCartData(String uid) async {
    try {
      await _users.doc(uid).collection('Cart').get().then((value) {
        userCartList = List.generate(
            value.size, (index) => Cart.fromMap(value.docs[index]));
      });
      print('userCartList list is done ');
      print(userCartList.length);
    } catch (e) {
      print('Failed: ' + e.toString());
    }
  }

  //order
  List<OrderModel> orderDataList = [];

  loadOrderData() async {
    try {
      await orderRef.get().then((value) {
        orderDataList = List.generate(
          value.size,
          (index) => OrderModel.fromFirestore(value.docs[index]),
        );
      });
      print('order List done');
    } catch (e) {
      print('Order List Failed: ' + e.toString());
    }
  }
}
