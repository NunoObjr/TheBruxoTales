import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComunidadePage extends StatefulWidget {
  @override
  _ComunidadePageState createState() => _ComunidadePageState();
}

class _ComunidadePageState extends State<ComunidadePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey,
        body: Row(
          children: <Widget>[navBarL()],
        ));
  }

  Widget navBarL() {
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
                height: 100.0,
                child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: new RotatedBox(
                        quarterTurns: 1,
                        child: OutlineButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Inicio",
                                style: TextStyle(fontSize: 20))))))),
        Padding(
          padding: EdgeInsets.only(top: 15, right: 20),
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
            padding: EdgeInsets.only(top: 15, right: 5),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                width: 45.0,
                height: 150.0,
                padding: EdgeInsets.only(top: 18, right: 10),
                child: new RotatedBox(
                    quarterTurns: 1,
                    child: Text("Comunidade",
                        style: TextStyle(
                          fontSize: 20,
                        ))))),
        Padding(
          padding: EdgeInsets.only(top: 15, right: 20),
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
                Divider(color: Colors.grey, height: 20),
                Container(
                    height: 240,
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
                                Container(
                                    padding: EdgeInsets.all(5),
                                    child: texto(
                                        snapshot.data.documents[0]['Titulo']
                                            .toString(),
                                        34.0)),
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
}
