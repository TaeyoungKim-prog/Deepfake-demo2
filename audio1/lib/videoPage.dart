import 'package:audio/constant.dart';
import 'package:audio/transition.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'homescreen.dart';
import 'main.dart';


class VideoPage extends StatefulWidget{
  VideoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}


class _VideoScreenState extends State<VideoPage> {
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
                  child: Hero(
                      tag: "video",
                      child: Container(
                        height: 200,
                        width: 260,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("assets/video.png"),
                          ),
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 15,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                  ),
              ),
              SizedBox(height:45),
              Text("This is your Video", style: kJetMedium.copyWith(color: Colors.white))
            ],
          )
      ),
    );
  }
}