import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'ui/bd.dart';


void main() => runApp(new Home());

Widget buttonCriar(texto){
  return new Container(
    child: 
    SizedBox(
                  width: 180,
                  child: RaisedButton(
                      child: Text('$texto',
                            style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontStyle: FontStyle.normal,
                          )),
                      onPressed: () {
                        if(texto == 'Login'){
                          
                        }
                      },
                      color: Colors.green[300],
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))))
  );
}
Widget buttonGo(){
  return new Container(
    child:
    RaisedButton(
      child: Text('GO',
      ),
      onPressed: () {},
    )
  );
}

  Widget logo() {
    return new Container(
          child: 
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 2.5 / 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: Image(
                          image: AssetImage('assets/witcher.jpg'),
                          fit: BoxFit.fill,
                        )),
                  )),
      );
  }
  class LoginPage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota (tela)"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),
    );
  }
  }

  class CriarPage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota (tela)"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),
    );
  }
  }

  class Home extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return (
      Container(
      color: Colors.grey,
      child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:20.0),
          child: logo(),
        ),
        Padding(
          padding: EdgeInsets.only(top:60.0),
          child: buttonCriar('Criar')
        ),
        Padding(
          padding: EdgeInsets.only(bottom:140.0),
          child: buttonCriar('Login')
        ),
      ], 
    ),
    )
    );
  }
  }

  
