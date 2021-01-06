import 'package:flutter/material.dart';
import 'package:quest_app/views/Load.dart';
import 'package:quest_app/views/home.dart';
import 'package:quest_app/views/quest_choose.dart';
import 'package:quest_app/views/end.dart';

void main() => runApp(MyApp(
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quest Maker",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: loadscreen(),
    );
  }
}