import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_screen_viewmodel.dart';
import 'widgets/chat_item_widget.dart';
import 'widgets/text_voice_field_widget.dart';

class ChatScreenView extends StackedView<ChatScreenViewModel> {
  const ChatScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Chat Bot',
            style: TextStyle(
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: viewModel.scrollController,
                // reverse: true,
                itemCount: viewModel.ochat.length,
                itemBuilder: (context, index) => ChatItem(
                  text: viewModel.chat(index).text, //chats[index].message,
                  isMe: viewModel.chat(index).isme, //chats[index].isMe,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const TextAndVoiceField(),
            ),
          ],
        ));
  }

  @override
  ChatScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatScreenViewModel();
}
