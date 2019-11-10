import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _nameCtrl = TextEditingController();
  List dogos = [];

  Future<List> _getDogs(String breed) async{
    http.Response response;
    response = await http.get('https://api.thedogapi.com/v1/breeds/search?q=$breed&api_key=b39525d5-e59a-42a9-ae35-85eabe2c2041');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Meu App', style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(color: Colors.pinkAccent, fontSize: 15.0)
                        ),
                        style: TextStyle(color: Colors.grey),
                        controller: _nameCtrl,
                        onChanged: (text){
                          if(text == ''){
                            setState(() {
                              dogos = [];
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 50.0,
                      child: RaisedButton(
                      color: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        child: Image.asset('img/animal-paw-print.png')
                        ),
                      onPressed: (){
                        _getDogs(_nameCtrl.text)
                          .then((data){
                            setState(() {
                              dogos = data;
                            });
                          });
                      },
                    ),
                    )
                  ],
                ),
                _buildDogo()
              ],
            ),
          ),
      );
  }

  Widget loading(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            child: Image.asset('img/dog.png'),
          ),
          SizedBox(height: 20,),
          Text('C\'mon, I\'m waiting for your search!', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget dogList(){
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top:10),
        itemCount: dogos.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(dogos[index]['name'], style: TextStyle(color: Colors.grey, fontSize: 20),),
              ),
            ),
            onTap: ,
          );
        },

      )
    );
  }

  Widget _buildDogo(){
    if(dogos.length == 0){
      return loading();
    }

    return dogList();
  }
}