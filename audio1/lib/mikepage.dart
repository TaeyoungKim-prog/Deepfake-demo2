import 'package:audio/constant.dart';
import 'package:audio/transition.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'homescreen.dart';
import 'main.dart';


class MikePage extends StatefulWidget{
  MikePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MikeScreenState createState() => _MikeScreenState();
}


class _MikeScreenState extends State<MikePage> {
  var _img = "assets/microphone_two.png";
  double _width = 256;
  int count = 0;

  void updateImg() {
    setState(() {
      (count == 0) ? _img = "assets/loading.gif" : _img = "assets/tick.png";
      (count == 0) ? _width = 340 : _width = 255;
      count += 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2A2826),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(icon: Icon(Icons.arrow_back), color: Colors.white, iconSize: 48, onPressed: () => Navigator.pop(context))
            ),
            SizedBox(height:60),
            AnimatedContainer(
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 700),
              child: InkWell(
                  child: Hero(
                    tag: "mic",
                      child: Image.asset(_img, width: _width)
                  ),
                onTap: () => updateImg(),
              ),
            ),
            SizedBox(height:45),
            (count > 1) ? Text("Done!", style: kJetMedium.copyWith(color: Colors.white)) : Text("Record Your Voice", style: kJetMedium.copyWith(color: Colors.white))
          ],
        )
      ),
    );
  }
}