import 'package:carousel_slider/carousel_controller.dart';

import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final CarouselController carouselController = CarouselController();

  List imageList = [
    'assets/images/TRAVEL.png',
    'assets/images/TRAVEL.png',
    'assets/images/TRAVEL.png',
    'assets/images/TRAVEL.png',
    'assets/images/TRAVEL.png',
  ];
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