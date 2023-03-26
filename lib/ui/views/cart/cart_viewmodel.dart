import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  final List<Map<String, dynamic>> itemsInCart = [
    {
      "name": "Dairy",
      "image": "assets/images/ghee.jpg",
      "quantity": 1,
      "price": 400
    },
    {
      "name": "Fruits",
      "image": "assets/images/cow.jpg",
      "quantity": 1,
      "price": 500
    },
    {
      "name": "Eggs",
      "image": "assets/images/Eggs.jpg",
      "quantity": 1,
      "price": 700
    },
    {
      "name": "Goat Milk",
      "image": "assets/images/Goat.jpg",
      "quantity": 1,
      "price": 800
    },
    {
      "name": "Dairy",
      "image": "assets/images/ghee.jpg",
      "quantity": 1,
      "price": 200
    },
    {
      "name": "Fruits",
      "image": "assets/images/cow.jpg",
      "quantity": 1,
      "price": 100
    },
    {
      "name": "Eggs",
      "image": "assets/images/Eggs.jpg",
      "quantity": 1,
      "price": 150
    },
    {
      "name": "Goat Milk",
      "image": "assets/images/Goat.jpg",
      "quantity": 1,
      "price": 350
    },
  ];

  void incrementQuantity(int index) {
    int quantity = itemsInCart[index]["quantity"];
    quantity++;
    itemsInCart[index]["quantity"] = quantity;
    rebuildUi();
  }

  void decrimentQuantity(int index) {
    int quantity = itemsInCart[index]["quantity"];
    quantity--;
    if (quantity <= 0) {
      quantity = 1;
    }
    itemsInCart[index]["quantity"] = quantity;
    rebuildUi();
  }

  void deleteitemfromcart(int index) {
    itemsInCart.removeAt(index);
    rebuildUi();
  }

  int totalprice() {
    int total = 0;
    if (itemsInCart.isNotEmpty) {
      for (int i = 0; i < itemsInCart.length; i++) {
        int price = itemsInCart[i]["price"];
        int quantity = itemsInCart[i]["quantity"];
        total = total + (price * quantity);
      }
    } else {
      total = 0;
    }
    return total;
  }
}
