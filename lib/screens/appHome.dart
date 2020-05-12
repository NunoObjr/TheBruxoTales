import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/ComunidadePage.dart';

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
        body: Stack(children: <Widget>[],)
        
        
        
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(color: Colors.pink, child: navBar()),
              Expanded(
                  child: Container(
                      color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: searchBar()),
                          bio(),
                          Divider(
                            color: Colors.transparent,
                            height: 50,
                          ),
                          
                              Positioned(
                                child: Container(
                                    color: Colors.blue, child: feed()),
                              )
                            ,
                          
                        ],
                      ))),
              Container(color: Colors.red, child: profileBar())
            ]));
  }

  Widget profileBar() {
    var opacidade = 1.0;
    var clique = false;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: OutlineButton(
                      onPressed: () {
                        if (clique == false) {
                          clique = !clique;

                          opacidade = 0;
                        } else {
                          clique = !clique;
                          opacidade = 1;
                        }
                      },
                      borderSide: BorderSide.none,
                      child: Icon(Icons.account_circle, size: 50)),
                ),
                Text(
                  "CarpeadoBugado",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                )
              ])),
          Opacity(
              opacity: opacidade,
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 35,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.launch, size: 30))
                  ]))),
          Opacity(
              opacity: opacidade,
              child: Padding(
                padding: EdgeInsets.only(top: 6, left: 4),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.people_outline, size: 35)),
                        Padding(
                          child: SizedBox(
                              width: 60,
                              child: Text(
                                "Amigos",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          padding: EdgeInsets.only(left: 8),
                        )
                      ],
                    )),
              )),
          Opacity(
              opacity: opacidade,
              child: Padding(
                padding: EdgeInsets.only(top: 6, left: 4),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.history, size: 35)),
                        Padding(
                          child: SizedBox(
                              width: 60,
                              child: Text(
                                "Historico",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          padding: EdgeInsets.only(left: 8),
                        )
                      ],
                    )),
              )),
          Opacity(
              opacity: opacidade,
              child: Padding(
                padding: EdgeInsets.only(top: 6, left: 4),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.layers, size: 35)),
                        Padding(
                          child: SizedBox(
                              width: 60,
                              child: Text(
                                "Galeria",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          padding: EdgeInsets.only(left: 8),
                        )
                      ],
                    )),
              )),
          Opacity(
              opacity: opacidade,
              child: Padding(
                padding: EdgeInsets.only(top: 6, left: 4),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.help_outline, size: 35)),
                        Padding(
                          child: SizedBox(
                              width: 60,
                              child: Text(
                                "Dicas",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          padding: EdgeInsets.only(left: 8),
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }

  Widget difCor() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('Usuarios')
            .document('Andrey kk')
            .collection('Conto')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading data...');
          } else if (snapshot.data.documents[0]['Dificuldade'].toString() ==
              '0') {
            return Row(children: <Widget>[
              Icon(
                Icons.sentiment_very_dissatisfied,
              ),
              Icon(
                Icons.sentiment_very_dissatisfied,
              ),
              Icon(
                Icons.sentiment_very_dissatisfied,
              )
            ]);
          } else {
            return null;
          }
        });
  }

  Widget feed() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('Usuarios')
            .document('Andrey kk')
            .collection('Conto')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading data...');
          } else {
            return Column(
              children: <Widget>[
                texto('Suas Histórias:', 20.0),
                Divider(color: Colors.grey, height: 10),
                Container(
                    height: 210,
                    width: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/card1.jpg'))),
                    child: ClipRect(
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                texto(
                                    snapshot.data.documents[0]['Titulo']
                                        .toString(),
                                    34.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 30,
                                    ),
                                    texto(
                                        snapshot.data.documents[0]['Nota']
                                            .toString(),
                                        30.0)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    texto('Dificuldade:', 25.0),
                                    difCor()
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
                        icon: Icon(Icons.arrow_left),
                        iconSize: 40,
                        onPressed: () {}),
                    Divider(
                      color: Colors.transparent,
                      indent: 50,
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_right),
                        iconSize: 40,
                        onPressed: () {})
                  ],
                )
              ],
            );
          }
        });
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
                width: 45.0,
                height: 100.0,
                child: Padding(
                    padding: EdgeInsets.only(top: 27, right: 5),
                    child: new RotatedBox(
                        quarterTurns: 1,
                        child:
                            Text("Inicio", style: TextStyle(fontSize: 20)))))),
        Padding(
          padding: EdgeInsets.only(top: 15, right: 35),
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
            padding: EdgeInsets.only(top: 15, right: 35),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                width: 30.0,
                height: 150.0,
                padding: EdgeInsets.only(top: 4, right: 5),
                child: new RotatedBox(
                    quarterTurns: 1,
                    child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComunidadePage()));
                        },
                        child: Text("Comunidade",
                            style: TextStyle(
                              fontSize: 20,
                            )))))),
        Padding(
          padding: EdgeInsets.only(top: 15, right: 35),
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
}
