import 'package:flutter/material.dart';

class CriarPage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Criar Page"),
            RaisedButton(onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Retornar !'),)
          ]
        ),
      ),
    );
  }
  }