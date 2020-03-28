import 'package:flutter/material.dart';
import './weather-detail.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  String city="";
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(city+" City"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: this.textEditingController,
                    style: TextStyle(fontSize: 22),
                    decoration: InputDecoration(hintText: 'Taper une ligne...'),
                    onChanged: (text){
                      setState(() {
                        this.city = text;
                      });
                    },
                    onSubmitted: (value){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>WeatherDetails(city)
                      ));
                      textEditingController.text="";
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    child: Text('Get Wheather...',
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>WeatherDetails(city)
                      ));
                      textEditingController.text="";
                    },
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
