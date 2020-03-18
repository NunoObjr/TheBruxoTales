import 'package:flutter/material.dart';

class CriarPage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return(
      Container(
      color: Colors.grey,
      child:
      Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:20.0),
          child: logo(),
        ),
        Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0, top: 10.0),
              child: SizedBox(
                width:240,
                height:30,
                child:input("Email")
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0),
              child: SizedBox(
                width:240,
                height:30,
                child:input("Username")
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0),
              child: SizedBox(
                width:240,
                height:30,
                child:input("Senha")
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0),
              child: SizedBox(
                width:240,
                height:30,
                child:input("Confirmar Senha")
              )
            ),
            Padding(
            padding: EdgeInsets.only(bottom:40.0),
            child: buttonGo(context)
            ),
            Padding(
              padding: EdgeInsets.only(bottom:30.0),
              child: buttonCriar(context, "Voltar")
            ),
      ], 
      ),
      )
    );
      
  }
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

  Widget buttonGo(context){
    return new Container(
    decoration: new BoxDecoration(
      boxShadow:[
        BoxShadow(
          color: Colors.black,
          blurRadius:5.0, //clarea
          spreadRadius: 0.0,//expande
          offset: Offset(
            0.0, //horizontal
            6.0, //vertical
          ),
        )
      ],
      borderRadius: new BorderRadius.circular(50.0),
    ),
    child: 
    SizedBox(
                  width: 100,
                  height: 90,
                  child: RaisedButton(
                      child: Text('GO',
                            style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontStyle: FontStyle.normal,
                          )),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      color: Color.fromARGB(255,110,159,106),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)
                      )
                      )
      )
  );
  }

  Widget buttonCriar(BuildContext context,texto){
  return new Container(
    decoration: new BoxDecoration(
      boxShadow:[
        BoxShadow(
          color: Colors.black,
          blurRadius:5.0, //clarea
          spreadRadius: 0.0,//expande
          offset: Offset(
            0.0, //horizontal
            6.0, //vertical
          ),
        )
      ],
      borderRadius: new BorderRadius.circular(50.0),
    ),
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
                        Navigator.pop(context);

                      },
                      color: Color.fromARGB(255,110,159,106),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))))
  );
}

Widget input(nome) {
  return (
    Scaffold(
      body: TextField(
          textAlign: TextAlign.center,
          onChanged: (text) {
            print('letra $text');
          },
          obscureText: false, //texto em formato de senha (true para sim)
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.red), //cor do label
            labelText: '$nome', /*,labelStyle caso queira editar o labelText?*/
          ),
          style: TextStyle(color: Colors.purple, fontSize: 20))));
}