import 'package:flutter/material.dart';
import 'package:thebruxotales/screens/appHome.dart';

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
            Divider(color: Colors.grey),
            logo(),
            Divider(color: Colors.grey, height: 40.0),
            Text('Username', style: TextStyle(fontSize: 35.0)),
            Divider(color: Colors.grey, height: 25.0),
            Container(
                alignment: Alignment.center,
                width: 240,
                height: 32,
                child: input(
                  'Username',
                  textControllerUsername,
                  false,
                )),
            Divider(color: Colors.grey, height: 25.0),
            Text('Password', style: TextStyle(fontSize: 35)),
            Divider(color: Colors.grey),
            Container(
                alignment: Alignment.center,
                width: 240,
                height: 32,
                child: input(
                  "Password",
                  textControllerPassword,
                  false,
                )),
            Divider(color: Colors.grey),
            buttonGo(context),
            Divider(color: Colors.grey),
            buttonCriar(context, "Voltar"),
          ],
        )));
  }


  Widget buttonGo(BuildContext context) {
    return new 
    Container(
        child: SizedBox(
            height:70,
            child: RaisedButton(
              color: Colors.green[300],
              shape: CircleBorder(),
              onPressed: () {
                if (verificador(textControllerUsername.text, textControllerPassword.text)==true){
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AppHome()));
                }
              },
              child: Text('GO',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    
                  )),
            )));
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
                  verificador(
                      textControllerUsername.text, textControllerPassword.text);
                },
                color: Colors.green[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))));
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

  Widget input(String hint, TextEditingController controlador, var obscure) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controlador,
      autofocus: false,
      textAlign: TextAlign.start,
      maxLines: 1,
      obscureText: obscure,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 0.9,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        hintText: hint,
        hintStyle: TextStyle(height: 0),
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
}