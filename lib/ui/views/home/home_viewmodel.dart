import 'package:carousel_slider/carousel_controller.dart';
import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/model/slider_model.dart';
import 'package:organic_market/services/firestore_service.dart';

import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final CarouselController carouselController = CarouselController();
  final _firestoreService = locator<FireStoreService>();

//  List imageList = [
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//     'assets/images/TRAVEL.png',
//   ];
  List<Sliderimage> item = [];
  Future fetchpost() async {
    item = _firestoreService.item;
  }

  List<Sliderimage> image() {
    return _firestoreService.item;
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