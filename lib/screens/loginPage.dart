import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Login Page"),
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