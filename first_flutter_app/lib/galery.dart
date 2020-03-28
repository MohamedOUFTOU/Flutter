import 'package:flutter/material.dart';
import './galery-data-page.dart';

class Galery extends StatefulWidget {
  @override
  _GaleryState createState() => _GaleryState();
}

class _GaleryState extends State<Galery> {
  String keyWord="";
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("${this.keyWord}"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: textEditingController,
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(hintText: 'Taper a place...'),
              onSubmitted: (value){
                setState(() {
                  this.keyWord=value;
                });
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=>GaleryDataPage(this.keyWord)
                ));
                this.textEditingController.text="";
              },
              onChanged: (value){
                setState(() {
                  this.keyWord=value;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: RaisedButton(
              color: Colors.deepOrange,
              child: Text('Get Images...',
              style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (context)=>GaleryDataPage(this.keyWord)
                ));
                this.textEditingController.text="";
              },
            ),
          )
        ],
      )
    );
  }
}
