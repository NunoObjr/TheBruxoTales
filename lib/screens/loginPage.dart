import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  
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
                  verificador(
                      textControllerUsername.text, textControllerPassword.text);
                },
                color: Colors.green[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))));
  }

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
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Container(
                    width: 240,
                    height: 30,
                    child: input(
                      "Username",
                      'Username',
                      'teste',
                      textControllerUsername,
                      false,
                    ))),
            Text('Password', style: TextStyle(fontSize: 25)),
            Padding(
                padding: EdgeInsets.only(bottom: 40, top: 20),
                child: Container(
                    width: 240,
                    height: 30,
                    child: input(
                      "Password",
                      'Password',
                      'testesword',
                      textControllerPassword,
                      false,
                    ))),
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

Widget input(
  String nome,
  label,
  hint,
  TextEditingController controlador,
  var obscure,
) {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: controlador,

    autofocus: false,
    textAlign: TextAlign.start,
    maxLines: 1,
    obscureText: obscure, //texto em formato de senha
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

verificador(String username, password) {
  if (username == 'admin' && password == 'admin') {
    print(true);
    return true;
  } else {
    print(false);
    return false;
  }
}
