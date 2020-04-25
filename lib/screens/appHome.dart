import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../my_flutter_app_icons.dart';

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
                padding: EdgeInsets.only(top: 30, left: 10),
                child: searchBar()),
            bio(),
            ],
            )),
            profileBar()
        ])
      );
  }



Widget texto(texto){
  return Text('$texto', style: TextStyle(fontSize: 20),);
}

Widget profileBar() {
  var opacidade = 0.0;
  var clique = false;
  setState((){});
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

Widget bio(){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
              padding: EdgeInsets.only(top: 60, left: 30),
              child: texto('CarpeadoBugado'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30),
              child: texto('Pontos: 570'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30),
              child: texto('Ranking global: 1'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30),
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
}