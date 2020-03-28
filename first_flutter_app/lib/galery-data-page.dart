import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GaleryDataPage extends StatefulWidget {
  String keyword;

  GaleryDataPage(this.keyword);
  @override
  _GaleryDataPageState createState() => _GaleryDataPageState();
}

class _GaleryDataPageState extends State<GaleryDataPage> {
  int curentPage=1;
  int size = 10;int totalPages=0;
  List<dynamic> imageData=[];
  var galeryData;

  ScrollController _scrollController = new ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
  }
  @override
  void initState() {
    super.initState();
    getData(widget.keyword);
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          if(curentPage < totalPages) {
            ++this.curentPage;
            getData(widget.keyword);
          }
        });
      }
    });


  }

  getData(String key){
    String url =
    'https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=' +
        key +
        '&page=${curentPage}&per_page=${size}&image_type=photo&pretty=true';
    http.get(url)
      .then((response){
        setState(() {
          this.galeryData = json.decode(response.body);
          if(this.galeryData['totalHits']%size == 0){
            this.totalPages = this.galeryData['totalHits']~/size;
          }else{
            this.totalPages = (this.galeryData['totalHits']/size).floor()+1;
          }
          this.imageData.addAll(galeryData['hits']);
          print(this.galeryData);
        });
    })
      .catchError((err){
        print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("${widget.keyword} | Page : ${curentPage}/${totalPages}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
      ),
      body: (this.galeryData == null)?
          Center(
            child: CircularProgressIndicator(),
          ):
          ListView.builder(
              controller: _scrollController,
              itemCount: (this.galeryData == null)?0:this.imageData.length,
              itemBuilder: (context,index){
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Card(
                        color: Colors.deepOrange,
                        child: Text(this.imageData[index]['tags'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10,bottom: 10),
                      child: Card(
                        child: Image.network(this.imageData[index]['webformatURL'],
                          fit: BoxFit.fitWidth ,),
                      ),
                    )
                  ],
                );
              })
    );
  }
}
