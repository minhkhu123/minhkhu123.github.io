import 'package:flutter/material.dart';
import 'package:quest_app/views/quest_choose.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  'Chào mừng bạn',
                  style: TextStyle(
                    fontFamily: "Lobster",
                    color: Colors.white,
                    fontSize: 50.0,
                    letterSpacing: 2.0,
                  ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text('đến với',
                style: TextStyle(
                  fontFamily: "Lobster",
                  color: Colors.white,
                  fontSize: 50.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text('Quest Maker!',
                style: TextStyle(
                  fontFamily: "Lobster",
                  color: Colors.white,
                  fontSize: 50.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.red,
                    shape: CircleBorder(),
                ),
                child: IconButton(onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => getjson()));
                },
                  icon: Icon(Icons.play_arrow),
                  color: Colors.white,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
