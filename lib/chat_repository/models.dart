import 'dart:ui';

import 'package:flutter/material.dart';

class ChatModel {
  List<UserModel> members;
  MessageModel lastMessage;
  DateTime createdTime;
  ColorMessage? colorMessage;
  DataField? dataField;
  BackGroundColor? backGroundColor;

  ChatModel(this.members, this.lastMessage, this.createdTime, this.dataField, [this.colorMessage,this.backGroundColor] );

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
class ColorMessage{
  String textMessage;
  Color color;
  ColorMessage( this.textMessage,  this.color);
}
class DataField {
  String? text;
  int? number;
  DataField({this.text,this.number});
}

class BackGroundColor{
  Color color;
  BackGroundColor(this.color);
}

