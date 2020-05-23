import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComunidadePage extends StatefulWidget {
  final String usuario;
  final int contos;
  ComunidadePage(this.usuario, this.contos);
  @override
  _ComunidadePageState createState() => _ComunidadePageState();
}

class _ComunidadePageState extends State<ComunidadePage> {
  @override
  Widget build(BuildContext context) {
    return Container (decoration: BoxDecoration(
      gradient:LinearGradient(begin:Alignment.topRight,end:Alignment.bottomLeft,
        colors: [Colors.red,Colors.blueAccent,Colors.red]
    )),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        
        backgroundColor: Colors.transparent,
        body: Stack(children: <Widget>[
          Row(
            children: <Widget>[
               navBarL(),
               Column(
                    children: <Widget>[
                      Divider(color: Colors.transparent, height: 25),
                      Container(width: 200, child: searchBar()),
                      Divider(color: Colors.transparent, height: 5),
                      Row(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DropdownButton(
                                isDense: true,
                                items: ["Ranking Brasil", "Deusa linda"]
                                    .map((item) => DropdownMenuItem(
                                        child: Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Text(item))))
                                    .toList(),
                                onChanged: (algo) {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.filter_list, size: 30)
                      ]),
                      Container(
                          height: 460,
                          width: 212,
                         
                        
                          child: ListView(
                              addAutomaticKeepAlives: false,
                              children: List.generate(widget.contos, (index) {
                                return stories(widget.usuario, index);
                              }))),
                    ],
                  ),
               Column(
                    children: <Widget>[
                      profileBarC(widget.usuario),
                      Padding(
                        padding: EdgeInsets.only(left: 48),
                        child: navBarR(),
                      )
                    ],
                  )
            ],
          )
        ])));
  }

  Widget navBarL() {
    return  Column(children: <Widget>[
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
                            borderSide: BorderSide.none,
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
      ],
    );
  }

  Widget navBarR() {
    return Container(
      child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 25, left: 20),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                ),
                width: 30.0,
                height: 100.0,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 5),
                    child: new RotatedBox(
                        quarterTurns: 3,
                        child:
                            Text("Amigos", style: TextStyle(fontSize: 20)))))),
        Padding(
            padding: EdgeInsets.only(top: 15, left: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              width: 30.0,
              height: 100.0,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 5),
                  child: new RotatedBox(
                      quarterTurns: 3,
                      child: Text("Galeria", style: TextStyle(fontSize: 20)))),
            )),
        Padding(
            padding: EdgeInsets.only(top: 15, left: 20),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                ),
                width: 30.0,
                height: 110.0,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 5),
                    child: new RotatedBox(
                        quarterTurns: 3,
                        child: Text("Histórico",
                            style: TextStyle(
                              fontSize: 20,
                            )))))),
        Padding(
          padding: EdgeInsets.only(top: 15, left: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
            ),
            width: 30.0,
            height: 90.0,
            child: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 5),
                child: new RotatedBox(
                    quarterTurns: 3,
                    child: Text("Dicas", style: TextStyle(fontSize: 20)))),
          ),
        )
      ]),
    );
  }

  Widget texto(texto, fontsize) {
    return Text(
      '$texto',
      style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.w600),
    );
  }

  Widget difCor(usuario) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('Usuarios')
            .document(usuario)
            .collection('Conto')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
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

Widget profileBarC(usuario) {
  var opacidade = 1.0;
  //var clique = false;

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
                      mostrar(usuario);
                    },
                    borderSide: BorderSide.none,
                    child: Icon(Icons.account_circle, size: 50)),
              ),
              Text(
                usuario,
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
      ],
    ),
  );
}

mostrar(usuario) async {
  QuerySnapshot querySnapshot = await Firestore.instance
      .collection('Usuarios')
      .document(usuario)
      .collection('Conto')
      .getDocuments();
  querySnapshot.documents.forEach((d) {
    print(d.data);
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

Widget texto(texto, fontsize) {
  return Text(
    '$texto',
    style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.w600),
  );
}

Widget stories(usuario, index) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.account_circle, size: 35),
                  Text(
                    usuario,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                  height: 220,
                  width: 280,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/card1.jpg'))),
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: 240,
                                  padding: EdgeInsets.all(5),
                                  child: texto(
                                      snapshot.data.documents[index]['Titulo']
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
                                      snapshot.data.documents[index]['Nota']
                                          .toString(),
                                      30.0)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  texto('Dificuldade:', 22.0),
                                  difCor(usuario, index),
                                ],
                              ),
                              Divider(color: Colors.transparent),
                              Padding(padding:EdgeInsets.only(right:7),
                                child:Text(
                                  'Vezes jogadas: ' +
                                      snapshot.data
                                          .documents[index]['Vezes-Jogadas']
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600))),
                            ],
                          )))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 18,
                      width: 18,
                      child: Image.network(
                          'https://vignette.wikia.nocookie.net/witcher/images/2/28/Tw2_CE_Oren_obverse.png/revision/latest?cb=20110707105030')),
                  Text(
                    "999",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    color: Colors.transparent,
                    endIndent: 10,
                  ),
                  Text(
                    "Coment",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    color: Colors.transparent,
                    endIndent: 10,
                  ),
                  Text(
                    "Add lib",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          );
        }
      });
}

Widget difCor(usuario, index) {
  return StreamBuilder(
      stream: Firestore.instance
          .collection('Usuarios')
          .document(usuario)
          .collection('Conto')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else if (snapshot.data.documents[index]['Dificuldade'].toString() ==
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
        } else if (snapshot.data.documents[index]['Dificuldade'].toString() ==
            '1') {
          return Row(children: <Widget>[
            Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
            Icon(Icons.sentiment_very_dissatisfied),
            Icon(Icons.sentiment_very_dissatisfied),
          ]);
        } else if (snapshot.data.documents[index]['Dificuldade'].toString() ==
            '2') {
          return Row(children: <Widget>[
            Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
            Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
            Icon(Icons.sentiment_very_dissatisfied),
          ]);
        } else {
          return Row(children: <Widget>[
            Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
            Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
            Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
          ]);
        }
      });
}
