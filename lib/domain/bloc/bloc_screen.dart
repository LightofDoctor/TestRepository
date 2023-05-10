import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/bloc/first_screen_Events.dart';
import 'package:test_flutter/domain/bloc/first_screen_States.dart';
import 'package:test_flutter/domain/bloc/use_case_chat.dart';


class FirstScreenBloc extends Bloc<ChatEvents,ChatStates>{
  GetAllChatsUseCase getAllChatsUseCase;
  FirstScreenBloc(this.getAllChatsUseCase): super (LoadedChatState(getAllChats: [])){
    checkResult ();
  }
  checkResult (){
    try {
      final result = getAllChatsUseCase.chatRepository.getAllChats();
      emit(LoadedChatState(getAllChats: result));
    } catch(ex){
      emit(ErrorChatState());
    }
  }

}