import 'dart:ui';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Row(children: <Widget>[
          navBar(),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 80),
                    child: searchBar()),
                Padding(padding: EdgeInsets.only(right: 80), child: bio()),
                Divider(height: 25, color: Colors.transparent),
                feed(),
              ],
            ),
          )
        ])));
  }
}

Widget feed() {
  return Column(
    children: <Widget>[
      texto('Suas Histórias:', 20.0),
      Divider(color: Colors.grey, height: 20),
      Container(
          height: 220,
          width: 280,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/card1.jpg'))),
          child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 240,
                          height:90,
                          padding: EdgeInsets.all(5),
                          child:
                          texto('A morte da bezerra', 34.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30,
                          ),
                          texto('5,0', 30.0)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          texto('Dificuldade:', 25.0),
                          Icon(Icons.sentiment_very_dissatisfied,
                              color: Colors.red),
                          Icon(Icons.sentiment_very_dissatisfied,
                              color: Colors.red),
                          Icon(Icons.sentiment_very_dissatisfied)
                        ],
                      ),
                      Divider(color: Colors.transparent),
                      texto('Vezes jogadas: 999', 25.0),
                    ],
                  )))),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_left), iconSize: 40, onPressed: () {}),
          Divider(
            color: Colors.transparent,
            indent: 50,
          ),
          IconButton(
              icon: Icon(Icons.arrow_right), iconSize: 40, onPressed: () {})
        ],
      )
    ],
  );
}

Widget texto(texto, fontsize) {
  return Text(
    '$texto',
    style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.w600),
  );
}

Widget bio() {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: texto('CarpeadoBugado', 20.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: texto('Pontos: 570', 20.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: texto('Ranking global: 1', 20.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: texto('Ranking Brasil: 1', 20.0),
        ),
      ]);
}

Widget searchBar() {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(21))),
      prefixIcon: (Icon(Icons.search, size: 40, color: Colors.grey)),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

Widget navBar() {
  return Container(
    child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 25, right: 20),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: new BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              width: 30.0,
              height: 110.0,
              child: Padding(
                  padding: EdgeInsets.only(top: 27, right: 5),
                  child: new RotatedBox(
                      quarterTurns: 1,
                      child: Text("Inicio", style: TextStyle(fontSize: 20)))))),
      Padding(
        padding: EdgeInsets.only(top: 60, right: 20),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            width: 30.0,
            height: 110.0,
            padding: EdgeInsets.only(top: 34, right: 5),
            child: new RotatedBox(
                quarterTurns: 1,
                child: Text("Criar", style: TextStyle(fontSize: 20)))),
      ),
      Padding(
        padding: EdgeInsets.only(top: 60, right: 20),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            width: 30.0,
            height: 110.0,
            padding: EdgeInsets.only(top: 10, right: 5),
            child: new RotatedBox(
                quarterTurns: 1,
                child: Text("Comunidade", style: TextStyle(fontSize: 20)))),
      ),
      Padding(
        padding: EdgeInsets.only(top: 60, right: 20),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            width: 30.0,
            height: 110.0,
            padding: EdgeInsets.only(top: 17, right: 5),
            child: new RotatedBox(
                quarterTurns: 1,
                child: Text("Ranking", style: TextStyle(fontSize: 20)))),
      ),
    ]),
  );
}
