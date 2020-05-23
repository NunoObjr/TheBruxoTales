import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/ComunidadePage.dart';

class AppHome extends StatefulWidget {
  final String usuario;
  final int contos;
  AppHome(this.usuario, this.contos);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      gradient:LinearGradient(begin:Alignment.topRight,end:Alignment.bottomLeft,
        colors:[Colors.red,Colors.blue,Colors.red]
      )
    ),
      child:
    Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(left: 0, top: 0, child: navBarL()),
          Positioned(
            width: 200,
            top: 24,
            left: 60,
            child: searchBar(),
          ),
          Positioned(
              top: 130, left: 80, height: 130, child: bio(widget.usuario)),
          Positioned(
              bottom: 0,
              left: 50,
              height: 300,
              child: feed(widget.usuario, widget.contos)),
          Positioned(
              right: 0, top: 24, height: 280, child: ProfileBar(widget.usuario))
        ])));
  }

  Widget difCor(usuario, contos) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('Usuarios')
            .document(usuario)
            .collection('Conto')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else if (snapshot.data.documents[contos]['Dificuldade']
                  .toString() ==
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
          } else if (snapshot.data.documents[contos]['Dificuldade']
                  .toString() ==
              '1') {
            return Row(children: <Widget>[
              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              Icon(Icons.sentiment_very_dissatisfied),
              Icon(Icons.sentiment_very_dissatisfied),
            ]);
          } else if (snapshot.data.documents[contos]['Dificuldade']
                  .toString() ==
              '2') {
            return Row(children: <Widget>[
              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              Icon(Icons.sentiment_very_dissatisfied),
            ]);
          } else if (snapshot.data.documents[contos]['Dificuldade']
                  .toString() ==
              '3') {
            return Row(children: <Widget>[
              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
            ]);
          } else {
            return null;
          }
        });
  }

  PageController pageViewController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );
  Widget feed(usuario, contos) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('Usuarios')
            .document(usuario)
            .collection('Conto')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: texto('Suas Histórias:', 18.0)),
                Divider(color: Colors.grey, height: 10),
                Container(
                    height: 213,
                    width: 290,
                    child: PageView(
                      controller: pageViewController,
                      children: List.generate(contos, (index) {
                        
                        return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/card1.jpg'))),
                            child: ClipRect(
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 2.0, sigmaY: 2.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            width: 200,
                                            child: texto(
                                                snapshot
                                                    .data
                                                    .documents[index]
                                                        ['Titulo']
                                                    .toString(),
                                                34.0)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 30,
                                            ),
                                            texto(
                                                snapshot
                                                    .data
                                                    .documents[index]
                                                        ['Nota']
                                                    .toString(),
                                                30.0)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            texto('Dificuldade:', 25.0),
                                            difCor(usuario, index)
                                          ],
                                        ),
                                        Divider(color: Colors.transparent),
                                        Text(
                                            'Vezes jogadas: ' +
                                                snapshot
                                                    .data
                                                    .documents[index]
                                                        ['Vezes-Jogadas']
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ))));
                      }),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_left),
                        iconSize: 40,
                        onPressed: () {
                          pageViewController.previousPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.elasticOut);
                        }),
                    Divider(
                      color: Colors.transparent,
                      indent: 50,
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_right),
                        iconSize: 40,
                        onPressed: () {
                          pageViewController.nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.linear);
                        })
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

  Widget bio(usuario) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('Usuarios')
            .document(usuario)
            .collection('UserInfo')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  texto(usuario, 20.0),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Pontos: ' +
                          snapshot.data.documents[0]['Pontos'].toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Ranking global: ' +
                          snapshot.data.documents[0]['Ranking-Global']
                              .toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Ranking Brasil: ' +
                          snapshot.data.documents[0]['Ranking-Nacional']
                              .toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ]);
          }
        });
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
                        borderSide: BorderSide.none,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ComunidadePage(widget.usuario, widget.contos)));
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

class ProfileBar extends StatefulWidget {
  final String usuario;
  ProfileBar(this.usuario);

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  var opacidade;
  bool clique;
  @override
  void initState() {
    opacidade = 0.0;
    clique = false;
    super.initState();
  }

  Widget build(BuildContext context) {
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
                          setState(() {
                            clique = !clique;

                            opacidade = 0.0;
                          });
                        } else {
                          setState(() {
                            clique = !clique;
                            opacidade = 1.0;
                          });
                        }
                      },
                      borderSide: BorderSide.none,
                      child: Icon(Icons.account_circle, size: 50)),
                ),
                Text(
                  widget.usuario,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                            child: Icon(Icons.people_outline, size: 30)),
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
                            child: Icon(Icons.history, size: 30)),
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
                            child: Icon(Icons.layers, size: 30)),
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
                            child: Icon(Icons.help_outline, size: 30)),
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
}
