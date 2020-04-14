import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../main.dart';

class CriarPage extends StatefulWidget {
  @override
  _CriarPageState createState() => _CriarPageState();
}

class _CriarPageState extends State<CriarPage> {
  TextEditingController textControllerEmail = TextEditingController();
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerSenha = TextEditingController();
  TextEditingController textControllerConfirmarSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    firestore() {
      Firestore.instance.collection('usuarios').document().setData({
        'email': textControllerEmail.text,
        'nome': textControllerUsername.text,
        'senha': textControllerSenha.text
      });
    }

    Widget buttonGo(BuildContext context) {
      return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0, //clarea
                spreadRadius: 0.0, //expande
                offset: Offset(
                  0.0, //horizontal
                  6.0, //vertical
                ),
              )
            ],
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: SizedBox(
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
                    if (_formKey.currentState.validate()) {
                      firestore();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(backgroundColor: Colors.green,
<<<<<<< HEAD
                              title: Text('Cadastro Concluído!'),
=======
                              title: Text('Cadastro Concluído!',),
>>>>>>> developObertran
                              content: RaisedButton(
                                onPressed: () {
                                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                                },
                                child: Text('Ok'),
                              ),
                            );
                          });
                    }
                  },
                  color: Color.fromARGB(255, 110, 159, 106),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)))));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Divider(color: Colors.white),
                  logo(),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                          width: 280,
                          child: input(textControllerEmail, 'Email', false))),
                  Text('Username', style: TextStyle(fontSize: 25)),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: SizedBox(
                          width: 280,
                          child: input(
                              textControllerUsername, 'Username', false))),
                  Text('Senha', style: TextStyle(fontSize: 25)),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                          width: 280,
                          child: input(textControllerSenha, 'Senha', true))),
                  Text('Confirmar Senha', style: TextStyle(fontSize: 25)),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                          width: 280,
                          child: input(textControllerConfirmarSenha,
                              'Confirmar Senha', true))),
                  Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: buttonGo(context)),
                  Padding(
                      padding: EdgeInsets.only(top: 60.0, bottom: 5.0),
                      child: buttonCriar(context, "Voltar")),
                ]))));
  }

  Widget input(controlador, hint, obscure) {
    return TextFormField(
      validator: (text) {
        if (hint == 'Email') {
          if (text.isEmpty || !text.contains('@')) {
            return 'Email inválido';
          }
        }
        if (hint == 'Username') {
          if (text.isEmpty ||
              (text.length) > 15 ||
              !text.contains(RegExp(r'^[a-zA-Z0-9]+$'))) {
            return 'Username inválido';
          }
        }
        if (hint == 'Senha') {
          if (text.isEmpty || text.length < 8) {
            return 'Senha inválida';
          }
        }
        if (hint == 'Confirmar Senha') {
          if (text.isEmpty) {
            return 'Confirme a senha';
          }
          if (textControllerSenha.text != textControllerConfirmarSenha.text) {
            return 'As senhas não coincidem';
          }
        }
      },
      controller: controlador,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hint,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }

  Widget logo() {
    return Container(
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

  Widget buttonCriar(BuildContext context, dynamic texto) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0, //clarea
              spreadRadius: 0.0, //expande
              offset: Offset(
                0.0, //horizontal
                6.0, //vertical
              ),
            )
          ],
          borderRadius: BorderRadius.circular(50.0),
        ),
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
                color: Color.fromARGB(255, 110, 159, 106),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))));
  }
}
