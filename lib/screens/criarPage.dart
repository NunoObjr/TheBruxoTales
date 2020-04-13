import 'package:flutter/material.dart';

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
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child:
                Column(
                    
                    children: <Widget>[
                      logo(),
                      Text('Email',
                        style: TextStyle(fontSize: 25),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                              width: 240,
                              height: 30,
                              child: input(textControllerEmail, 'Email')
                              )
                            ),
                      Text('Username', style: TextStyle(fontSize: 25)),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                              width: 240,
                              height: 30,
                              child: input(textControllerUsername, 'Username'))),
                      Text('Senha', style: TextStyle(fontSize: 25)),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                              width: 240,
                              height: 30,
                              child: input(textControllerSenha, 'Senha'))),
                      Text('Confirmar Senha', style: TextStyle(fontSize: 25)),
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                              width: 240,
                              height: 30,
                              child: input(
                                  textControllerConfirmarSenha, 'Confirmar Senha'))),
                      Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: buttonGo(context)),
                      Padding(
                          padding: EdgeInsets.only(top: 60.0, bottom: 5.0),
                          child: buttonCriar(context, "Voltar")),
                    ]))));
  }

  Widget input(controlador, tipo){
    return TextFormField(
      validator: (text) {
        if (text.isEmpty || !text.contains('@')) {
          return 'Email inválido';
        }
      },
      keyboardType: TextInputType.text,
      controller: controlador,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 0.9,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: -9),
        filled: true,
        fillColor: Colors.white,
        hintText:tipo
      ),
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

  Widget buttonGo(BuildContext context){
    return Container(
    decoration: BoxDecoration(
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
      borderRadius: BorderRadius.circular(50.0),
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
                        if(textControllerConfirmarSenha.text == textControllerSenha.text && textControllerUsername.text != '' && textControllerEmail.text != ''){
                          Navigator.pop(context);
                        }
                        else{

                        }
                        

                      },
                      color: Color.fromARGB(255,110,159,106),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)
                      )
                      )
      )
  );
  }

  Widget buttonCriar(BuildContext context,dynamic texto){
  return Container(
    decoration: BoxDecoration(
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
      borderRadius: BorderRadius.circular(50.0),
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
}
