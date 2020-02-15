import 'package:flutter/material.dart';

void main() {
  var criar = 'Criar';
  var login = 'Login';
  
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
          child: buttonCriar(criar)
        ),
        Padding(
          padding: EdgeInsets.only(bottom:140.0),
          child: buttonCriar(login)
        ),
      ], 
    ),
    )
  ));
}

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
                      onPressed: () {},
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

