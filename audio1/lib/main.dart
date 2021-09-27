import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Presentation',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "NotoSans",
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.blueGrey)),
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
