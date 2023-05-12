import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/chat_repository/chat_repo.dart';
import 'package:test_flutter/chat_repository/models.dart';
import 'package:test_flutter/domain/bloc/bloc_screen.dart';
import 'package:test_flutter/domain/bloc/use_case_chat.dart';
import 'package:test_flutter/presentation/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> FirstScreenBloc(GetAllChatsUseCase(ChatRepository())),
      child:  MaterialApp(
        theme: ThemeData(
          //brightness: Brightness.dark,
          primaryColor: Color(0xFF0a2a3f),
          //fontFamily: 'Georgia',
        ),
        home: ChatScreen(),
      ),



    );
  }
}
