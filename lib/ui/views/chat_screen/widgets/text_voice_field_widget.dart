import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/chat_screen/chat_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'send_button.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/chat_model.dart';
// import '../providers/chats_provider.dart';
// import '../services/ai_handler.dart';
// import '../services/voice_handler.dart';
// import 'toggle_button.dart';

enum InputMode {
  text,
  voice,
}

class TextAndVoiceField extends ViewModelWidget<ChatScreenViewModel> {
  const TextAndVoiceField({super.key});

  @override
  Widget build(BuildContext context, ChatScreenViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: viewModel.chatController,
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 06,
        ),
        ToggleButton(
          isListening: false,
          isReplying: false,
          inputMode: InputMode.text,
          sendTextMessage: () => viewModel.addItemToList(
              Chat(text: viewModel.chatController.text, isme: false)),
          sendVoiceMessage: () {},
        )
      ],
    );
  }
}
