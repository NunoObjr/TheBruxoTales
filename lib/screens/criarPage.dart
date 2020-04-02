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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              logo(),
              Text('Email', style: TextStyle(fontSize: 25),),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      width: 240,
                      height: 30,
                      decoration: BoxDecoration(),
                      child: input("Email", textControllerEmail))),
              Text('Username', style: TextStyle(fontSize: 25)),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      width: 240,
                      height: 30,
                      child: input("Username", textControllerUsername))),
              Text('Senha', style: TextStyle(fontSize: 25)),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      width: 240,
                      height: 30,
                      child: input("Senha", textControllerSenha))),
              Text('Confirmar Senha', style: TextStyle(fontSize: 25)),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                      width: 240,
                      height: 30,
                      child: input(
                          "Confirmar Senha", textControllerConfirmarSenha))),
            Padding(
            padding: EdgeInsets.only(top:40.0),
            child: buttonGo(context)
            ),
            Padding(
              padding: EdgeInsets.only(top:60.0, bottom:5.0),
              child: buttonCriar(context, "Voltar")
            ),
            ])));
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
  Widget input(String nome, var controlador) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controlador,
      autofocus: false,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.done,
      obscureText: false, //texto em formato de senha
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(2),
        labelText: "",
        labelStyle: TextStyle(
          color: Colors.pink,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 5)),
        hintText: '',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
