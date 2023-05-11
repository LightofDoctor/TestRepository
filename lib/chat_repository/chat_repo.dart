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
        DateTime.now(),DataField(text: 'Yesterday'),
        ColorMessage('', Colors.white),
      ),


      ChatModel([UserModel('Daren Swinney,Lan...', 'assets/icons/icons8-butterfly-64 (1).png')],
        MessageModel('Darren: Perhaps if there was some...',
            UserModel('Daren Swinney', 'assets/icons/icons8-butterfly-64 (1).png')),

          DateTime.now(),DataField(text: '13.24'),

          ColorMessage( 'chalenge', Colors.green),
      ),
      ChatModel([
          UserModel('Alexandr Murphy', 'assets/icons/icons8-butterfly-48.png')],
          MessageModel('Alexander: Based on what you`ve told', UserModel('Alexandr Murphy', 'assets/icons/icons8-butterfly-48.png')),
         DateTime.now(),DataField(text: 'Mon'),

        ColorMessage('Help Req', Colors.red),
      ),
      ChatModel([
          UserModel('Stephane Jones', 'assets/icons/icons8-butterfly-64 (2).png')],
          MessageModel('You: What time do you think you`ll be...', UserModel('Stephane Jones', 'assets/icons/icons8-butterfly-64 (2).png')),
              DateTime.now(),DataField(text: '14.48'),

        ColorMessage('', Colors.white),
      ),
      ChatModel(
          [UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')],
          MessageModel('You: Thanks Julie', UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')),
              DateTime.now(),DataField(text: '14.48'),

        ColorMessage('Help Req', Colors.yellow),
      ),
      ChatModel(
        [UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')],
        MessageModel('You: Thanks Julie', UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')),
        DateTime.now(),DataField(text: '14.48'),

        ColorMessage('Help Req', Colors.yellow),
      ),


    ];
  }
  }