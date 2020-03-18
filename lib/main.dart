import 'package:flutter/material.dart';
import "./screens/loginPage.dart";
import "./screens/criarPage.dart";


void main() => runApp(MaterialApp(
  title:'Main',
  home: Home()
));

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
                        if(texto=="Login"){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => LoginPage()
                            )
                          );
                        }
                        else
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => CriarPage()
                            )
                          );

                      },
                      color: Colors.green[300],
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))))
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
          child: buttonCriar(context,'Criar')
        ),
        Padding(
          padding: EdgeInsets.only(bottom:140.0),
          child: buttonCriar(context,'Login')
        ),
      ], 
    ),
    )
    );
  }
  }

  

