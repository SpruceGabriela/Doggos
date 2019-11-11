import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DogoPage extends StatelessWidget {
  
  final Map dogos;
  String image = '';

  DogoPage(this.dogos);

  Future<Map> _getImage() async{
    String search = this.dogos['name'].split(" ").join("+");
    http.Response response;
    response = await http.get("https://api.unsplash.com/search/photos?client_id=32d294b4e7769247291b8a1addff858b1fda8278818443736e272fe043169719&query=$search");
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          this.dogos['name'], style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getImage(),
        builder: (context, snapshot){
          print(snapshot.data);
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Text('hdfsf fhyfr');
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              return Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: snapshot.data['results'][0]['urls']['small'],
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              child: Image(image: AssetImage('img/pawprint.png'),),
                            ),
                            Text('Breed', style: TextStyle(fontSize: 20)),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(this.dogos['name'], style: TextStyle(color: Colors.grey),),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              child: Image(image: AssetImage('img/happiness.png'),),
                            ),
                            Text('Temperament', style: TextStyle(fontSize: 20)),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(this.dogos['name'], style: TextStyle(color: Colors.grey),),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              child: Image(image: AssetImage('img/flag.png'),),
                            ),
                            Text('Country', style: TextStyle(fontSize: 20)),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(this.dogos['name'], style: TextStyle(color: Colors.grey),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            default:
          }
        },
      )
    );
  }
}