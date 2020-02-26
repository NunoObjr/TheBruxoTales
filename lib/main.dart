import 'package:flutter/material.dart';

void main() {
  const criar = 'Criar';
  const login = 'Login';
  
  runApp(MaterialApp(
    title: 'teste',
    home: Container(
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
