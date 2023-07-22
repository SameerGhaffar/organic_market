// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends BaseViewModel {
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<Chat> ochat = [
    Chat(text: 'hey', isme: true),
    Chat(text: 'how can i help you', isme: false),
    Chat(text: 'i want to make biryani, provide me the recipe', isme: true),
    Chat(text: """
Here's a basic recipe for Biryani, a popular Indian rice dish:

Ingredients:

2 cups Basmati rice
1 lb (450g) chicken, lamb, or vegetables
2 onions, thinly sliced
2 tomatoes, chopped
2 tablespoons Biryani masala powder
1 tablespoon ginger-garlic paste
1/2 cup plain yogurt
1/4 cup chopped fresh cilantro (coriander) leaves
1/4 cup chopped fresh mint leaves
4 cups water
1/4 cup ghee or vegetable oil
Whole spices (2 cinnamon sticks, 4 cloves, 4 green cardamom pods, 2 bay leaves)
Salt to taste""", isme: false),
  ];

  chat(int index) {
    List<Chat> reversedChat = ochat;
    return reversedChat[index];
  }

  void addItemToList(Chat item) {
    ochat.add(item);
    chatController.clear();
    chatController.notifyListeners();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    rebuildUi();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    chatController.dispose();
  }
}

class Chat {
  final String text;
  final bool isme;
  Chat({
    required this.text,
    required this.isme,
  });
}
