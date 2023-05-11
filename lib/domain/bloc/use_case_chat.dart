import 'package:test_flutter/chat_repository/chat_repo.dart';

class GetAllChatsUseCase{
  final ChatRepository chatRepository;
  GetAllChatsUseCase( this.chatRepository);


  getAllChats(){
    return chatRepository.getAllChats();
  }
}