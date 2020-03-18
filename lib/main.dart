import 'package:flutter/material.dart';

Widget buttonCriar(texto) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 6,
                spreadRadius: -2,
                offset: Offset(0, 4)),
          ]),
      width: 180,
      child: RaisedButton(
          onPressed: () {},
          child: Text('$texto',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                letterSpacing: 2.0,
                fontStyle: FontStyle.normal,
              )),
          color: Color.fromARGB(1000, 121, 153, 127),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))));
}

Widget input(x) {
  return (Scaffold(
      body: TextField(
          textAlign: TextAlign.center,
          //keyboardType: TextInputType. para tipos permitidos de entrada
          onChanged: (text) {
            print('letra $text');
          },
          obscureText: false, //texto em formato de senha (true para sim)
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.red), //cor do label
            labelText: '$x', /*,labelStyle caso queira editar o labelText?*/
          ),
          style: TextStyle(color: Colors.purple, fontSize: 30))));
}

void main() {
  var x = 'Username';
  runApp(MaterialApp(home: input(x)));
}
