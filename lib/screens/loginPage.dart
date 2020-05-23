import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thebruxotales/screens/appHome.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
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
                        width: 300,
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
                        width: 300,
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
                ))));
  }

  Widget buttonGo(BuildContext context) {
    return new Container(
        child: SizedBox(
            height: 70,
            child: RaisedButton(
              color: Colors.red,
              shape: CircleBorder(),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  verificador(
                      textControllerUsername.text, textControllerPassword.text);
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
                  Navigator.pop(context);
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
      onFieldSubmitted:(a){
        verificador(textControllerUsername.text, textControllerPassword.text);
      },
      validator: (text) {
        if (hint == 'Username') {
          if (text.isEmpty) {
            return 'Digite seu usuário';
          }
        } else if (hint == 'Password') {
          if (text.isEmpty) {
            return 'Digite sua senha';
          }
        }
        return null;
      },
      controller: controlador,
      obscureText: obscure,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 0.9,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  verificador(usuario, senha) async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection('Usuarios').getDocuments();
   QuerySnapshot queryContos =  await Firestore.instance.collection('Usuarios').document(usuario).collection('Conto').getDocuments();
    querySnapshot.documents.forEach((d) {
      if (d.documentID == usuario && d.data['password'] == senha) {
        final contos = queryContos.documents.length;
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => AppHome(usuario,contos)));
      } else {
        return null;
      }
    });
  }
}
