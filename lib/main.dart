import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();
  @override


  
void initState() {
    super.initState();
    // Start listening to changes.
    textController.addListener(printLatestValue);
  }
printLatestValue() {
  print("Second text field: ${textController.text}");
}

  Widget build(BuildContext context) {
    var nome='obertran';
    return input(nome);
  }

  Widget input(nome) {
    return (Form(
        child: Scaffold(
            body: TextFormField(
      controller: textController,
      textAlign: TextAlign.center,
      //keyboardType: TextInputType. para tipos permitidos de entrada
      obscureText: false, //texto em formato de senha (true para sim)
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.red), //cor do label
        labelText: '$nome', /*,labelStyle caso queira editar o labelText?*/
      ),
      style: TextStyle(color: Colors.purple, fontSize: 30),
    ))));
  }

  Widget buttonCriar(texto) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 6,
                  spreadRadius: -2,
                  offset: Offset(0, 4)),
            ]),
        width: 180,
        child: RaisedButton(
            onPressed: () {},
            child: Text('$texto',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontStyle: FontStyle.normal,
                )),
            color: Color.fromARGB(1000, 121, 153, 127),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))));
  }
}
