import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quest_app/views/home.dart';

class loadscreen extends StatefulWidget {
  @override
  _loadscreenState createState() => _loadscreenState();
}

class _loadscreenState extends State<loadscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "QuestMaker\nTest Yourself !!",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontFamily: "Lobster",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}