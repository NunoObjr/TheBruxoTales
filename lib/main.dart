import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'The Bruxo Tales',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
            ],
          ),
        ),
      ),
    ));
  }
}
