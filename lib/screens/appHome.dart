import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 30, left: 60, right: 80),
                child: Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(border:InputBorder.none,
                        prefixIcon:
                            (Icon(Icons.search, size: 40, color: Colors.grey)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ))),
            Padding(
              padding: EdgeInsets.only(top: 60, left: 75),
              child: texto('CarpeadoBugado'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 75),
              child: texto('Pontos: 570'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 75),
              child: texto('Ranking global: 1'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 75),
              child: texto('Ranking Brasil: 1'),
            ),
          ],
        ));
  }
}

Widget texto(texto) {
  return Text('$texto', style: TextStyle(fontSize: 20),);
}
