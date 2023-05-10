import 'package:test_flutter/chat_repository/models.dart';
import 'package:test_flutter/domain/bloc/first_screen_States.dart';

abstract class ChatStates{}



class LoadedChatState extends ChatStates{
  final List<ChatModel> getAllChats;
  LoadedChatState({ required this.getAllChats});

}
class ErrorChatState extends ChatStates{}