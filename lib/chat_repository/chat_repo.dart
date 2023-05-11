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
        DateTime.now().subtract(
          Duration(days: 1),
        ),
      ),
      ChatModel([UserModel('Daren Swinney,Lan...', 'assets/icons/icons8-butterfly-64 (1).png')],
        MessageModel('Darren: Perhaps if there was some...',
            UserModel('Daren Swinney', 'assets/icons/icons8-butterfly-64 (1).png')),
        DateTime.now().subtract(Duration(days: 2),

        ),
        'Challenge'
      ),
      ChatModel([
          UserModel('Alexandr Murphy', 'assets/icons/icons8-butterfly-48.png')],
          MessageModel('Alexander: Based on what you`ve told', UserModel('Alexandr Murphy', 'assets/icons/icons8-butterfly-48.png')),
        DateTime.now().subtract(Duration(days: 3),
        ),),
      ChatModel([
          UserModel('Stephane Jones', 'assets/icons/icons8-butterfly-64 (2).png')],
          MessageModel('You: What time do you think you`ll be...', UserModel('Stephane Jones', 'assets/icons/icons8-butterfly-64 (2).png')),
          DateTime.now().subtract(Duration(days: 3),
    )
      ),
      ChatModel(
          [UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')],
          MessageModel('You: Thanks Julie', UserModel('Julie McAndrew', 'assets/icons/icons8-butterfly-64.png')),
          DateTime.now().subtract(Duration(days: 3),
          )
      ),


    ];
  }
  }