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
    return BlocBuilder(
        bloc: firstScreenBloc,
        builder: (BuildContext context, state) {
          if (state is LoadedChatState) {
            final chats = state.getAllChats.elementAt(2);

            return Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(100),
                    child: AppBar(
                        backgroundColor: Color(0xFF0a2a3f),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                        chats.members[0].avatarPath),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Chat',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add_circle_outline_rounded,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ))),
                body: Column(children: [
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.only(left: 8.0),
                              hintText: 'Search',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Perform search action
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  // Rest of the widget tree

                  Expanded(
                    child: BlocBuilder(
                        bloc: firstScreenBloc,
                        builder: (BuildContext context, state) {
                          if (state is LoadedChatState) {
                            final chats = state.getAllChats;
                            return ListView.builder(
                                itemCount: chats.length,
                                itemBuilder: (contex, index) {
                                  final chat = chats[index];
                                  return Row(children: [
                                    Expanded(
                                        child: Container(
                                            child: Image.asset(
                                      chat.members[0].avatarPath,
                                    ))),
                                    Expanded(
                                      flex: 4,
                                        child: Container(
                                            child:  Padding(padding:EdgeInsets.only(left: 8,bottom: 8),child:
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                        Text(chat.members[0].name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text(chat.lastMessage.lastMessage,
                                            style: TextStyle(
                                              fontSize: 16,
                                            )),
                                        Container(
                                          child: Text(
                                              chat.colorMessage!.textMessage,
                                              style: TextStyle(
                                                  color: chat
                                                      .colorMessage!.color)),
                                          color: chat.backGroundColor!.color,
                                        )
                                      ],
                                    )))),
                                    Expanded(
                                        child: Container(
                                            child: Text(
                                                chat.dataField!.text.toString(),
                                                style:
                                                    TextStyle(fontSize: 13))))
                                  ]);
                                });
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                ]),
                floatingActionButton: _NavigationBar());
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

Widget _NavigationBar() {
  return NavigationBar(
    destinations: [
      NavigationDestination(
        icon: Icon(Icons.chat_outlined, color: Colors.pinkAccent),
        label: 'Chat',
      ),
      NavigationDestination(
        icon: Icon(Icons.notification_add_outlined),
        label: 'Notifications',
      ),
      NavigationDestination(
        icon: Icon(Icons.more_horiz_outlined),
        label: 'More',
      ),
    ],
  );
}
