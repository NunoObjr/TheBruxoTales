import 'package:flutter/material.dart';
void buttoncriar(){
  runApp(MaterialApp(
      home: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 180,
                  child: RaisedButton(
                      child: Text("Criar",
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
            ],
          ))));
}
void main() {
  buttoncriar();
}
