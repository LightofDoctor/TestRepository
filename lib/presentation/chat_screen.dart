import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/bloc/bloc_screen.dart';
import 'package:test_flutter/domain/bloc/chat_screen_States.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late FirstScreenBloc firstScreenBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    firstScreenBloc = BlocProvider.of<FirstScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
            backgroundColor: Colors.indigo,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: Text('first'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Chat',
                      )
                    ],
                  ),
                 Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.add))
                    ],
                  )
                ],
              ),
            )),
      ),
      body: BlocBuilder(
        bloc: firstScreenBloc,
        builder: (BuildContext context, state) {
          if (state is LoadedChatState) {
            final chats = state.getAllChats;
            return ListView.builder(
                itemCount: chats.length,
                itemBuilder: (contex, index) {
                  final chat = chats[index];
                  return Row(
                    children: [
                      Column(
                        children: [Image.asset(chat.members[0].avatarPath)],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [Text(chat.members[0].name)],
                          ),
                          Row(
                            children: [Text(chat.lastMessage.lastMessage)],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        children: [Text(chat.createdTime.day.toString())],
                      )
                    ],
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
