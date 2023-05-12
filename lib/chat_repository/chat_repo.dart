import 'package:flutter/material.dart';

import 'models.dart';

class ChatRepository {
  List<ChatModel> getAllChats() {
    return [
      ChatModel(
        [
          UserModel(
            'Michal Grant',
            'assets/icons/icons8-butterfly-64.png',
          )
        ],
        MessageModel(
          'You:Thanks',
          UserModel(
            'Michal Grant',
            'assets/icons/icons8-butterfly-64.png',
          ),
        ),
        DateTime.now(),
        DateField(text: 'Yesterday'),
      ),
      ChatModel(
        [
          UserModel(
              'Daren Swinney', 'assets/icons/icons8-butterfly-64 (1).png'),
          UserModel('Lan...', 'assets/icons/icons8-butterfly-48.png'),
          UserModel('Dani', 'assets/icons/icons8-butterfly-96.png'),
        ],
        MessageModel(
            'Darren: Perhaps if there was some...',
            UserModel(
                'Daren Swinney', 'assets/icons/icons8-butterfly-64 (1).png')),
        DateTime.now(),
        DateField(text: '13.24'),
        ColorMessage(Colors.pinkAccent, Colors.white, 'Chalenge'),
      ),
      ChatModel(
        [UserModel('Alexandr Murphy', 'assets/icons/icons8-butterfly-48.png')],
        MessageModel(
            'Alexander: Based on what you`ve told',
            UserModel(
                'Alexandr Murphy', 'assets/icons/icons8-butterfly-48.png')),
        DateTime.now(),
        DateField(text: 'Mon'),
        ColorMessage(
          Colors.yellow,
          Colors.black,
          'Help Req',
        ),
      ),
      ChatModel(
        [
          UserModel(
              'Stephane Jones', 'assets/icons/icons8-butterfly-64 (2).png')
        ],
        MessageModel(
            'You: What time do you think you`ll be...',
            UserModel(
                'Stephane Jones', 'assets/icons/icons8-butterfly-64 (2).png')),
        DateTime.now(),
        DateField(text: '14.48'),
      ),
      ChatModel(
        [UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')],
        MessageModel(
            'You: Thanks Julie',
            UserModel(
                'Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')),
        DateTime.now(),
        DateField(text: '14.48'),
        ColorMessage(
          Colors.black38,
          Colors.white,
          'Engagement Partner',
        ),
      ),
      ChatModel(
        [UserModel('Dilan Edmonds', 'assets/icons/icons8-butterfly-64.png')],
        MessageModel('', UserModel('', '')),
        DateTime.now(),
        DateField(text: '14.48'),
      ),
    ];
  }
}
