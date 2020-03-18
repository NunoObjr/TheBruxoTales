import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
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
          padding: EdgeInsets.zero,
          child: Text("Username")
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Text("Password")
        ),
        Padding(
          padding: EdgeInsets.zero,
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