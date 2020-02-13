import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'teste',
    home: Container(
      color: Colors.grey,
      child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom:0.0),
          child: Text(
                      'imagem aqui', 
                      style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, height: 4),
          
                  ),
        ),
        Padding(
          padding: EdgeInsets.only(top:60.0),
          child: RaisedButton(
                  child: Text('Criar', style: TextStyle(color: Colors.black),),
                  onPressed: (){},
                  color: Colors.greenAccent,
                  ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom:140.0),
          child: RaisedButton(
                  child: Text('Login', style: TextStyle(color: Colors.black),),
                  onPressed: (){},
                  color: Colors.greenAccent,
                  ),
        ),
      ], 
    ),
    )
  ));
}

