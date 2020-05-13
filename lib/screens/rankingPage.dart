import 'package:flutter/material.dart';
import 'appHome.dart';
import 'criarPage.dart';
import 'dart:ui';
import '../my_flutter_app_icons.dart';
import 'package:flutter/foundation.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        body: Row(children: <Widget>[
          navBar(context),
          Expanded(child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: searchBar()),
            Divider(height: 25, color: Colors.grey),
            OutlineButton(
                  borderSide: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                          height: 25,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: <Widget>[
                              Divider(
                                indent: 6,
                              ),
                              Text('Deusa Linda'),
                              Icon(Icons.expand_more, size: 20)
                            ],
                          )),
                    ],
                  ),
                ),
            Container(width: 260,height: 650,child:ListView(
                children: <Widget>[
                  stories(),
                   Divider(height: 12, color: Colors.grey),
                  stories(),
                   Divider(height: 12, color: Colors.grey),
                  stories(),
                   Divider(height: 12, color: Colors.grey),
                  stories(),
                ]
              )),
            ],
            )),
        ])
      );
  }
}

Widget stories (){
  return Column(
    children: <Widget>[
      Row(children: <Widget>[
      Icon(Icons.account_circle, size: 65),
      Text("CarpeadoBugado"),

      ],),
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
                          padding: EdgeInsets.all(5),
                          child: texto('A morte da bezerra', 34.0)),
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
                  Row(children: <Widget>[
                    Text("999"),
                    Divider(color: Colors.transparent,endIndent: 10,),
                    Text("Comentarios"),
                    Divider(color: Colors.transparent,endIndent: 10,),
                    Text("Add lib"),
                  ],)
    ],
  );
}