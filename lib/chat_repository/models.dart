class ChatModel {
  List<UserModel> members;
  MessageModel lastMessage;
  DateTime createdTime;

  ChatModel(this.members, this.lastMessage, this.createdTime);
}

class UserModel {
  String name;
  String avatarPath;

  UserModel(this.name, this.avatarPath);
}

class MessageModel {
  String lastMessage;
  UserModel author;

  MessageModel(this.lastMessage, this.author);
}