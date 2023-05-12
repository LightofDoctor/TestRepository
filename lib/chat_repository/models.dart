import 'dart:ui';

import 'package:flutter/material.dart';

class ChatModel {
  List<UserModel> members;
  MessageModel lastMessage;
  DateTime createdTime;
  ColorMessage? colorMessage;
  DateField? dataField;

  ChatModel(this.members, this.lastMessage, this.createdTime, this.dataField,
      [this.colorMessage]);
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

class ColorMessage {
  String textMessage;
  Color bgColor;
  Color textColor;

  ColorMessage(this.bgColor, this.textColor, this.textMessage);
}

class DateField {
  String? text;
  int? number;

  DateField({this.text, this.number});
}
