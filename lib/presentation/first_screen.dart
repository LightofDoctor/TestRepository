import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
        leading: CircleAvatar(child: Text('first'),),
        title: Text('Chat'),),
      body: Column(children: [

      ],),
    );

  }

}
