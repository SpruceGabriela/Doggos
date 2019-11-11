import 'package:flutter/material.dart';
import 'package:meuapp/ui/Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
          Text('Doggos', style: TextStyle(
              color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home())
      );
    });
  }
}
