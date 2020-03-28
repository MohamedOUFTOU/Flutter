import 'package:flutter/material.dart';
import './Quiz.dart';
import './camera.dart';
import './galery.dart';
import './weather.dart';
import './qr-code-form.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrange,Colors.white]
                )
            ),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/flutter.png'),
              ),
            ),
          ),
          ListTile (
            title: Text("Quiz",style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Quiz()
              ));
            },
          ),
          Divider(color: Colors.orange,),
          ListTile (
            title: Text("Weather",style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Weather()
              ));
            },
          ),
          Divider(color: Colors.orange,),
          ListTile (
            title: Text("Gallery",style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Galery()
              ));
            },
          ),
          Divider(color: Colors.orange,),
          ListTile (
            title: Text("Camera",style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CameraPage()
              ));
            },
          ),
          Divider(color: Colors.orange,),
          ListTile (
            title: Text("QR code",style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => QRCodePage()
              ));
            },
          )
        ],
      ),
    );
  }
}
