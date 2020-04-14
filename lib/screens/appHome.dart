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
        body: Row(children: <Widget>[
          navBar(),
          Expanded(child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 30, left: 30, right: 70),
                child: searchBar()),
            bio(),
            ],
            )),
          Text('teste3'),
        ])
      );
  }
}

Widget texto(texto) {
  return Text('$texto', style: TextStyle(fontSize: 20),);
}

Widget bio(){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
              padding: EdgeInsets.only(top: 60, left: 45),
              child: texto('CarpeadoBugado'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 45),
              child: texto('Pontos: 570'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 45),
              child: texto('Ranking global: 1'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 45),
              child: texto('Ranking Brasil: 1'),
            ),
      ]
    )
  );
}

Widget navBar(){
  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 80,right: 20),
          child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: new BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          ),
            child: SizedBox(
              width: 30.0,
              height: 110.0,
              child: new Container(
                padding: EdgeInsets.only(top:27, right: 5),
                child:new RotatedBox(
                quarterTurns: 1,
                child: Text("Inicio", style:TextStyle(fontSize:20))
              )
              )
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60,right: 20),
          child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: new BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          ),
            child: SizedBox(
              width: 30.0,
              height: 110.0,
              child: new Container(
                padding: EdgeInsets.only(top:34, right: 5),
                child:new RotatedBox(
                quarterTurns: 1,
                child: Text("Criar", style:TextStyle(fontSize:20))
              )
              )
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60,right: 20),
          child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: new BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          ),
            child: SizedBox(
              width: 30.0,
              height: 110.0,
              child: new Container(
                padding: EdgeInsets.only(top:10, right: 5),
                child:new RotatedBox(
                quarterTurns: 1,
                child: Text("Comunidade", style:TextStyle(fontSize:20))
              )
              )
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60,right: 20),
          child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: new BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          ),
            child: SizedBox(
              width: 30.0,
              height: 110.0,
              child: new Container(
                padding: EdgeInsets.only(top:17, right: 5),
                child:new RotatedBox(
                quarterTurns: 1,
                child: Text("Ranking", style:TextStyle(fontSize:20))
              )
              )
            ),
          ),
        ),
      ]
    ),
  );
}

Widget searchBar(){
  return Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(border:InputBorder.none,
                        prefixIcon:
                            (Icon(Icons.search, size: 40, color: Colors.grey)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ));
}
