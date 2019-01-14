import 'package:flutter/material.dart';
import 'dart:async';
import'HomePage.dart';
import 'Config.dart';
import 'SplashScreen.dart';

void main() => runApp(MyApp());
/*colors(rgb)
(168,150,255)(184,174,246)(203,194,246)(221,214,256)
(191,153,253)(205,175,251)(221,191,253)(235,214,253)
(237,146,255)(237,173,251)(238,194,253)(246,215,255)
(251,153,228)(246,172,226)(255,191,238)(252,215,246)
*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    SplashScreen.tag: (context) => SplashScreen(),
};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: Config.title,
      theme: ThemeData(
        fontFamily: 'Karla',
        primarySwatch: Colors.green
        
      ),
      routes: routes,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}