import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meuapp/ui/Home.dart';
import 'package:meuapp/ui/splash.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,

  ));
}
