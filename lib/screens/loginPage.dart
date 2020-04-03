import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
    
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: logo(),
            ),
            Text('Username', style: TextStyle(fontSize: 25)),
            Padding(
                padding: EdgeInsets.only(bottom:20,top:20),
                child: Container(
                    width: 240,
                    height: 30,
                    child: input("Username", textControllerUsername))),
            Text('Password', style: TextStyle(fontSize: 25)),
            Padding(
                padding: EdgeInsets.only(bottom:40,top:20),
                child: Container(
                    width: 240,
                    height: 30,
                    child: input("Password", textControllerPassword))),
            Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: buttonCriar(context, "GO")),
            Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: buttonCriar(context, "Voltar")),
          ],
        )));
  }
}

Widget logo() {
  return new Container(
    child: Padding(
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

Widget buttonGo() {
  return new Container(
      child: RaisedButton(
    child: Text(
      'GO',
    ),
    onPressed: () {},
  ));
}

Widget buttonCriar(BuildContext context, texto) {
  return new Container(
      child: SizedBox(
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
                  borderRadius: BorderRadius.circular(15.0)))));
}

Widget input(String nome, var controlador) {
  return TextFormField(
    
    keyboardType: TextInputType.text,
    controller: controlador,
    autofocus: false,
    textAlign: TextAlign.start,
    maxLines: 1,
    
    obscureText: false, //texto em formato de senha
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height:1.4,
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      labelText: "",
      labelStyle: TextStyle(
        color: Colors.pink,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)),
      hintText: '',
      filled: true,
      fillColor: Colors.white,
    ),
  );
}
