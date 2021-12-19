import 'package:flutter/material.dart';
import 'screenA.dart';
import 'screenB.dart';
import 'screenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'naviatorApp',
      //home: FirstPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => screenA(),
        '/b': (context) => screenB(),
        '/c': (context) => screenC(),
      },
    );
  }
}
