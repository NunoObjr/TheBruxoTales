import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            child: Container(
                height: 590,
                child: Column(
                  
                  children: <Widget>[
                    searchBar(),
                    bio(),
                    feed(),
                  ],
                )),
          )
        ])));
  }
}

Widget feed() {
  return Column(
   
    children: <Widget>[
      Text('Suas Histórias'),
      Stack(
        children: <Widget>[
          Container(height: 200, width: 250, color: Colors.yellow),
          Positioned(
              right: 40,
              child: Container(height: 200, width: 250, color: Colors.red)),
          Positioned(
              right: 80,
              child: Container(height: 200, width: 250, color: Colors.blue)),
        ],
      )
    ],
  );
}

Widget texto(texto) {
  return Text(
    '$texto',
    style: TextStyle(fontSize: 20),
  );
}

Widget bio() {
  return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: texto('CarpeadoBugado'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: texto('Pontos: 570'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: texto('Ranking global: 1'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: texto('Ranking Brasil: 1'),
        ),
      ]);
}

Widget searchBar() {
  return TextField(
    decoration: InputDecoration(
      border: InputBorder.none,
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
