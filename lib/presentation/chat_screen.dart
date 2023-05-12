import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/chat_repository/models.dart';
import 'package:test_flutter/domain/bloc/bloc_screen.dart';
import 'package:test_flutter/domain/bloc/chat_screen_States.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/presentation/image_constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
              appBar: AppBar(
                backgroundColor: Color(0xFF0a2a3f),
                centerTitle: true,
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    chats.members[0].avatarPath,
                    height: 32,
                  ),
                ),
                title: Text('Chat'),
                actions: [
                  Icon(
                    Icons.add_comment_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  )
                ],
              ),
              body: SafeArea(
                  child: Column(children: [
                _search(),
                _chatsList(state.getAllChats),
              ])),
              bottomNavigationBar: _navigationBar(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget _search() => Row(
        children: [
          Flexible(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 8.0),
                      hintText: 'Search',
                    ),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                onPressed: () {
                  // Perform search action
                },
                icon: SvgPicture.asset(
                  ImageConstants.filterIcon,
                  color: Colors.pink,
                ),
              ),
            ),
          )
        ],
      );

  Widget _chatsList(List<ChatModel> chats) => Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.shade500,
            );
          },
          itemCount: chats.length,
          itemBuilder: (context, index) => _itemChat(chats[index]),
        ),
      );

  Widget _itemChat(ChatModel chat) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 48,
            width: 72,
            child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Stack(
                  children: _avatars(
                    chat.members,
                  ),
                ))),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(chat.members[0].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Text(chat.lastMessage.lastMessage,
                style: TextStyle(
                  fontSize: 16,
                )),
            if (chat.colorMessage != null) ...[
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // <= No more error here :)
                  color: chat.colorMessage!.bgColor,
                ),
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                    child: Text(
                      chat.colorMessage!.textMessage,
                      style: TextStyle(
                        color: chat.colorMessage!.textColor,
                        fontSize: 16,
                      ),
                    )),
              )
            ]
          ],
        ))),
        SizedBox(
          width: 8,
        ),
        Column(
          children: [
            Text(chat.dataField!.text.toString(),
                style: TextStyle(fontSize: 14)),
          ],
        ),
        SizedBox(
          width: 16,
        ),
      ]);

  List<Widget> _avatars(List<UserModel> users) {
    final List<Widget> avatars = [];

    if (users.length > 1) {
      avatars.add(Positioned(
          left: 16,
          child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Image.asset(
                users[1].avatarPath,
                height: 40,
              ))));
    }

    avatars.add(CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          users[0].avatarPath,
          height: 40,
        )));

    if (users.length > 1) {
      avatars.add(Positioned(
          left: 14,
          bottom: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              color: Color(0xFF0a2a3f),
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                child: Text(
                  '+${users.length}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
          )));
    }

    return avatars;
  }

  Widget _navigationBar() {
    return NavigationBar(
      elevation: 8,
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
}
