import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150.0,
            width: 150.0,
            child: Image(
              image: AssetImage('img/dog-house.png'),
            ),
          ),
          Text('Meu App', style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}