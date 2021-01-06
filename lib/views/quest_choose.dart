import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:quest_app/views/end.dart';
class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("asset/quest.json"),
        builder: (context, snapshot){
          List mydata = json.decode(snapshot.data.toString());
          if(mydata == null){
            return Scaffold(
              body: Center(
                child: Text('Loading!'),
              ),
            );
          }else{
            return Quest(mydata: mydata,);
          }
    });
  }
}

class Quest extends StatefulWidget {

  var mydata;

  Quest({Key key, @required this.mydata}) : super(key: key);

  @override
  _QuestState createState() => _QuestState(mydata);
}

class _QuestState extends State<Quest> {

  var mydata;
  _QuestState(this.mydata);

  List<String> ansKeeper = [];
  List<String> answerKeeper = [];

  Color colortoshow = Colors.blue;
  Color colorcheck = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int i = 1;
  int count = 0;
  bool disableAnswer = false;

  Map<String, Color> btncolor = {
    "A": Colors.blue,
    "B": Colors.blue,
    "C": Colors.blue,
    "D": Colors.blue,
  };

  void previosquest(){
    setState(() {
      if(i > 1 && i < 10){
        i--;
        btncolor["A"] = Colors.blue;
        btncolor["B"] = Colors.blue;
        btncolor["C"] = Colors.blue;
        btncolor["D"] = Colors.blue;
      }
        disableAnswer = true;
      if (mydata[2][i.toString()] == ansKeeper[i - 1]) {
        colorcheck = right;
      } else {
        colorcheck = wrong;
      }
      print(ansKeeper[i - 1]);
      print(answerKeeper[i - 1]);
      btncolor[answerKeeper[i - 1]] = colorcheck;
    });
  }

  void nextquest(){
    setState(() {
      if(i < 10){
        i++;
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => End(count: count),
        ));
      }
      btncolor["A"] = Colors.blue;
      btncolor["B"] = Colors.blue;
      btncolor["C"] = Colors.blue;
      btncolor["D"] = Colors.blue;
      disableAnswer = false;
    });
  }

  void checkanswer(String k){
    if(mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      colortoshow = right;
      count += 10;
    }else{
      colortoshow = wrong;
      count -= 10;
    }
    setState(() {
      btncolor[k] = colortoshow;
      disableAnswer = true;
    });
  }

  Widget choicebutton(String k){
    return Container(
      child: MaterialButton(
        onPressed: () {
          checkanswer(k);
          ansKeeper.add(mydata[1][i.toString()][k]);
          answerKeeper.add(k);
        },

        child: Text(mydata[1][i.toString()][k],
          style: TextStyle(
            fontFamily: 'Alike',
            fontSize: 17.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.blue[200],
        highlightColor: Colors.blue[200],
        minWidth: 150.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Quest Maker'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 330.0),
                Text('$count',
                style: TextStyle(
                  fontFamily: "Alike",
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  letterSpacing: 2.0,
                  color: Colors.red,
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80.0),
                Text(mydata[0][i.toString()],
                  style: TextStyle(
                    fontFamily: "Alike",
                    fontSize: 25.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(height: 100.0),
                Expanded(
                  flex: 2,
                  child: IconButton(onPressed: () {
                    previosquest();
                  },
                    icon: Icon(Icons.arrow_back_ios_sharp),
                    ),
                ),
                Expanded(
                  flex: 6,
                  child: Image(
                    image: AssetImage(mydata[0]["img"+i.toString()]),
                  ),
                ),
                Expanded(
                  flex: 2,
                    child:  IconButton(onPressed: () {
                      nextquest();
                    },
                    icon: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(height: 120.0),
                Expanded(
                  child: AbsorbPointer(absorbing: disableAnswer,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: choicebutton('A'),
                  ),
                ),
                ),
                Expanded(
                  child: AbsorbPointer(absorbing: disableAnswer,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: choicebutton('B'),
                  ),
                ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(height: 10.0),
                Expanded(
                  child: AbsorbPointer(absorbing: disableAnswer,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: choicebutton('C'),
                  ),
                ),
                ),
                Expanded(
                  child: AbsorbPointer(absorbing: disableAnswer,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: choicebutton('D'),
                  ),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
