import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../my_flutter_app_icons.dart';
import 'dart:ui';
import "./rankingPage.dart";

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
          navBar(context),
          Expanded(child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: searchBar()),
            bio(),
            Divider(height: 25, color: Colors.grey),
            feed(),
            ],
            )),
            ProfileBar()
        ])
      ));
  }

}


class ProfileBar extends StatefulWidget {
  @override
  _ProfileBarState createState() => _ProfileBarState();
  
}

class _ProfileBarState extends State<ProfileBar> {
  var opacidade;
  bool clique;
   @override
  void initState(){
    opacidade = 0.0;
    clique = false;
    super.initState();
  }
 
  Widget build(BuildContext context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:25),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child:OutlineButton(onPressed: (){
                setState(() {
                  clique = !clique;
                });
                if(clique)
                  setState(() {
                    opacidade=1.0;
                  });
                else
                  setState(() {
                    opacidade = 0.0;
                  });
                print(opacidade);
                }, borderSide: BorderSide.none,child:Icon(Icons.account_circle, size: 65)),
                
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("CarpeadoBugado", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
              )
            ]
          )
        ),
        Opacity(opacity:opacidade,child:Padding(
          padding: EdgeInsets.only(top:10,left: 4),
          child: Row(
            children: <Widget>[
              Icon(Icons.settings, size: 45,),
              Padding(padding:EdgeInsets.only(left:20),child:Icon(Icons.launch, size: 45))
            ]
          )
        )),
        Opacity(opacity: opacidade,child:Padding(
          padding: EdgeInsets.only(top:12,left: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(20)
            ),
            child:Row(children: <Widget>[Padding(padding:EdgeInsets.only(left:5),child:Icon(Icons.people_outline, size: 45)),Padding(child:SizedBox(width:60,child:Text("Amigos",style: TextStyle(fontWeight: FontWeight.bold),)),padding: EdgeInsets.only(left:8),)],)
          ),
        )),
        Opacity(opacity: opacidade,child:Padding(
          padding: EdgeInsets.only(top:12,left: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(20)
            ),
            child:Row(children: <Widget>[Padding(padding:EdgeInsets.only(left:5),child:Icon(Icons.history, size: 45)),Padding(child:SizedBox(width:60,child:Text("Historico",style: TextStyle(fontWeight: FontWeight.bold),)),padding: EdgeInsets.only(left:8),)],)
          ),
        )),
        Opacity(opacity: opacidade,child:Padding(
          padding: EdgeInsets.only(top:12,left: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(20)
            ),
            child:Row(children: <Widget>[Padding(padding:EdgeInsets.only(left:5),child:Icon(Icons.layers, size: 45)),Padding(child:SizedBox(width:60,child:Text("Galeria",style: TextStyle(fontWeight: FontWeight.bold),)),padding: EdgeInsets.only(left:8),)],)
          ),
        )),
        Opacity(opacity: opacidade,child:Padding(
          padding: EdgeInsets.only(top:12,left: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(20)
            ),
            child:Row(children: <Widget>[Padding(padding:EdgeInsets.only(left:5),child:Icon(Icons.help_outline, size: 45)),Padding(child:SizedBox(width:60,child:Text("Dicas",style: TextStyle(fontWeight: FontWeight.bold),)),padding: EdgeInsets.only(left:8),)],)
          ),
        ))
      ],
    ),
  );
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

Widget navBar(BuildContext context) {
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
                child: OutlineButton(onPressed:((){
              Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RankingPage()));
            }),
                child:Text("Ranking", style: TextStyle(fontSize: 20))))),
      ),
    ]),
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