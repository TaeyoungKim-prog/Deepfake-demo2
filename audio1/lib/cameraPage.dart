import 'package:audio/constant.dart';
import 'package:audio/transition.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'homescreen.dart';
import 'main.dart';


class CameraPage extends StatefulWidget{
  CameraPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CameraScreenState createState() => _CameraScreenState();
}


class _CameraScreenState extends State<CameraPage> {
  var _imgMic = "assets/photograph.png";
  double _width = 256;
  bool photoTaken = false;

  void updateImg() {
    setState(() {
        photoTaken = true;
       _imgMic = "assets/tick.png";
       _width = 255;
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
                        tag: "camera",
                        child: Image.asset(_imgMic, width: _width)
                    ),
                    onTap: () => updateImg(),
                  ),
              ),
              SizedBox(height:45),
              (photoTaken)? Text("Done!", style: kJetMedium.copyWith(color: Colors.white)) : Text("Take your Picture", style: kJetMedium.copyWith(color: Colors.white))
            ],
          )
      ),
    );
  }
}