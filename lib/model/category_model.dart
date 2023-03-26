// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final String name;
  final String image;
  final Map<String, Item> items;

  Category({
    required this.name,
    required this.image,
    required this.items,
  });
}

class Item {
  final String name;
  final double price;
  final int quantity;

  Item({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
