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
        preferredSize: Size.fromHeight(100),
        child: AppBar(
            backgroundColor: Colors.lightBlue.shade500,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
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
                        style: TextStyle(fontSize: 30, fontFamily: 'IndieFlower'),
                      )
                    ],
                  ),
                 Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.add))
                    ],
                  ),
                ],
              ),

            )
        ),
      ),
      body:
      Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 8.0),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
              Container(
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
            ],
          ),

          // Rest of the widget tree


          Expanded(
            child: BlocBuilder(
            bloc: firstScreenBloc,
            builder: (BuildContext context, state) {
              if (state is LoadedChatState) {
                final chats = state.getAllChats;
                return
                  ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (contex, index) {
                      final chat = chats[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [Image.asset(chat.members[0].avatarPath)],
                          ),

                          Column(
                            children: [
                              Row(

                                children: [Text(chat.members[0].name,style: TextStyle(fontSize: 20),)],
                              ),
                              Row(
                                children: [Text(chat.lastMessage.lastMessage,

                                  style: TextStyle(fontSize: 17,
                                  )),
                                ],
                              ),
                              Row(children: [
                                Text(chat.colorMessage!.textMessage,style: TextStyle(color: chat.colorMessage!.color,
                                fontSize: 26),),
                              ],)
                            ],
                          ),

                          Column(

                            children: [Text(chat.dataField!.text.toString())],
                          ),

                        ],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
        ),
          ),
        ]
      ),
      floatingActionButton: _FloatingAtionButton()

    );


  }
}
Widget _FloatingAtionButton(){
  return Stack(
    children:[ Column(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
              FloatingActionButton(onPressed: (){},

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),
                side: BorderSide.none),

                child: Icon(Icons.chat_sharp),),
              Text('Chats'),

            ],),
            Column(children: [
              FloatingActionButton(onPressed:(){},
                shape: CircleBorder(),
                backgroundColor: Colors.white,
                child: Icon(Icons.notifications,
                color: Colors.black,),),
              Text('Notification'),

            ],),
            Column(
              children: [

                FloatingActionButton(onPressed: (){},
                  backgroundColor: Colors.white,
                  child: Icon(Icons.more_vert,
                  color: Colors.black,),),
                Text('More'),
              ],
            )
          ],)
      ],
    ),

  ]

  );
}
