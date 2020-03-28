import 'package:first_flutter_app/main-drawer.dart';
import 'package:flutter/material.dart';

import './main-drawer.dart';

void main() => runApp(MaterialApp(home: MyApp(),) );

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("My App"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
            child: Text(
              "Hello IIBDC",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.deepOrange),
            )
        ),
    );
  }

}