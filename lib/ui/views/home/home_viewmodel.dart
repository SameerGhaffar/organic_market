// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/app/app.bottomsheets.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/category_model.dart';
import 'package:organic_market/model/item_model.dart';
import 'package:organic_market/model/promotion_model.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/services/auth_service.dart';
import 'package:organic_market/services/cart_service.dart';
import 'package:organic_market/services/firestore_service.dart';
import 'package:organic_market/ui/views/item/item_view.dart';
import 'package:organic_market/ui/views/product/product_view.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final CarouselController carouselController = CarouselController();
  final _firestoreService = locator<FireStoreService>();
  final _navigation = locator<NavigationService>();
  final _bottomService = locator<BottomSheetService>();

  final _cartService = locator<CartService>();

  final _authService = locator<AuthService>();

  List<Item> itemList = [];

  Item itemdata(int index) {
    return itemList.map((e) => e).toList()[index];
  }

//  List imageList = [
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//   ];

  openProductSheet(Item item) {
    _firestoreService.setItem(item);
    _bottomService.showCustomSheet(variant: BottomSheetType.product);
    //_navigation.navigateToView(ProductView());
  }

  toProductpage() {
    _navigation.navigateToView(const ProductView());
  }

  Future fetchData() async {
    _firestoreService.productcategorysRef.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((doc) async {
        await _firestoreService.loadCategoryData();
        rebuildUi();
      });
    });
    _firestoreService.sliderImagesRef.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((doc) async {
        await _firestoreService.loadSliderImage();
        rebuildUi();
      });
    });
    _firestoreService.promotionImagesRef.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((doc) async {
        await _firestoreService.loadPromotionImage();
        rebuildUi();
      });
    });
    _firestoreService.itemRef.snapshots().listen((querySnapshot) async {
      await _firestoreService.loadItemData();

      itemList = _firestoreService.itemDataList
          // .where(
          //     (element) => element. == _firestoreService.categoryid)
          .toList();

      rebuildUi();
    });
    // _firestoreService.sliderDataList;
    // _firestoreService.promotionDataList;
    // _firestoreService.categoryDataList;
    /* _firestoreService.productcategorysRef.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((doc) async {
        if (doc.type == DocumentChangeType.removed) {
          await _firestoreService.loadCategoryData();
          rebuildUi();
        }
      });
    }); */
  }

  List<Sliderimage> sliderImage() {
    return _firestoreService.sliderDataList;
  }

  PromotionImage promotionImage(int index) {
    return promtoionlist().map((e) => e).toList()[index];
  }

  List<PromotionImage> promtoionlist() {
    return _firestoreService.promotionDataList;
  }

  ProductCategory categorydata(int index) {
    return categoryList().map((e) => e).toList()[index];
  }

  List<ProductCategory> categoryList() {
    return _firestoreService.categoryDataList;
  }
  // List<Sliderimage>? sliderlist;

  // late List<Sliderimage> sliderImages;
  // Future fetchimages() async {
  //   var sliderImages = _firestoreService.loadData();
  //   if (sliderImages is List<Sliderimage>) {
  //     sliderlist = sliderImages;
  //   } else {
  //     print("no image in ");
  //   }
  // }

  final List<Map<String, String>> categories = [
    {"name": "Dairy", "image": "assets/images/ghee.jpg"},
    {"name": "Fruits", "image": "assets/images/cow.jpg"},
    {"name": "Eggs", "image": "assets/images/Eggs.jpg"},
    {"name": "Goat Milk", "image": "assets/images/Goat.jpg"},
  ];
  final List<Map<String, String>> promotion = [
    {"name": "Dairy", "image": "assets/images/ghee.jpg"},
    {"name": "Fruits", "image": "assets/images/TRAVEL.png"},
    {"name": "Eggs", "image": "assets/images/Eggs.jpg"},
    {"name": "Goat Milk", "image": "assets/images/Goat.jpg"},
    {"name": "Dairy", "image": "assets/images/ghee.jpg"},
    {"name": "Fruits", "image": "assets/images/TRAVEL.png"},
    {"name": "Eggs", "image": "assets/images/Eggs.jpg"},
    {"name": "Goat Milk", "image": "assets/images/Goat.jpg"},
  ];

  int _currentIndex = 0;

  void updateindex(int index) {
    _currentIndex = index;
    rebuildUi();
  }

  int get currentIndex => _currentIndex;

  void tap({required String id, required String name}) async {
    _firestoreService.setDocId(id);
    _firestoreService.setDocName(name);
    _firestoreService.itemDataList = [];

    //  await _firestoreService.loadItemData();

    _navigation.navigateToView(const ItemView());

    // await _navigation.navigateTo(Routes.itemView);

    // _navigation.navigateToItemView();

    // _dialogService.showDialog(
    //     title: "category clicked", description: id, buttonTitle: "ok");
  }

  addToCart(String itemId, String itemName, BuildContext context) {
    _cartService.addToCart(
        itemId: itemId, quantity: 1, uid: _authService.auth.currentUser!.uid);

    Flushbar(
      // message: "$itemName have been added to your Cart",
      messageText: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemName,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          Text(
            "have been added to your cart",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
          )
        ],
      ),

      icon: const Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.white,
      ),
      duration: const Duration(milliseconds: 900),
      padding: const EdgeInsets.all(9),

      //animationDuration: Duration(milliseconds: 200),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,

      backgroundColor: Colors.green,
    ).show(context);

    print("itemId = $itemId");
  }
}

/*
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  } */
