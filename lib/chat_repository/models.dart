class ChatModel {
  List<UserModel> members;
  MessageModel lastMessage;
  DateTime createdTime;
  String? status = '';

  ChatModel(this.members, this.lastMessage, this.createdTime, [ this.status]);
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