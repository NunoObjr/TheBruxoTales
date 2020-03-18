import 'package:flutter/material.dart';

class CriarPage extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
    return(
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
              padding: EdgeInsets.only(left:80.0, right: 80.0, top: 10.0),
              child: SizedBox(
                width:200,
                height:30,
                child:input("Email")
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0),
              child: SizedBox(
                width:200,
                height:30,
                child:input("Username")
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0),
              child: SizedBox(
                width:200,
                height:30,
                child:input("Senha")
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:80.0, right: 80.0),
              child: SizedBox(
                width:200,
                height:30,
                child:input("Confirmar Senha")
              )
            ),
            Padding(
            padding: EdgeInsets.only(bottom:40.0),
            child: buttonCriar(context, "GO")
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

  Widget buttonCriar(BuildContext context,texto){
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
                        Navigator.pop(context);

                      },
                      color: Colors.green[300],
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