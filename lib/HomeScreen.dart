

import 'package:flutter/material.dart';
import 'package:texty/widgets/text_recognition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(115, 79, 150, 1),
        title:Text('Welcome to texty!',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:Column(
        children: [
          const SizedBox(height: 25),
          TextRecognitionWidget(),
          const SizedBox(height: 15),
        ],
      )
    );
  }
}
