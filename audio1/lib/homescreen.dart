import 'package:audio/cameraPage.dart';
import 'package:audio/constant.dart';
import 'package:audio/transition.dart';
import 'package:audio/videoPage.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:audio/mikepage.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/orator.jpg"),
                  ),
                ),
              ),
            ),
            //deepfake Presentation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" deepfake ", style: kJetMedium.copyWith(fontSize: 20)),
                Text("Presentation", style: kJetBold),
              ],
            ),
            //Two simple steps
            Padding(
              padding: const EdgeInsets.all(22),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Two simple steps", style: kJetMedium),
                      ],
                    ),
                    Row(
                      children: [
                        Text("To make your presentation",
                            style: kJetMedium.copyWith(
                                fontSize: 15, color: Colors.black45)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Camera
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 15,
                    color: Colors.black26,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text("Click the camera to take a picture.",
                      style: kJetMedium.copyWith(fontSize: 12)),
                  SizedBox(width: 20),
                  InkWell(
                    child: Hero(
                      tag: "camera",
                      child: Image.asset(
                        "assets/photograph.png",
                        width: 40,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, BouncyPageRoute(widget: CameraPage()));
                    },
                  ),
                ],
              ),
            ),
            //spacing
            Container(
              height: 15,
            ),
            //Microphone
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
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
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text("Click the mic to record your voice.",
                      style: kJetMedium.copyWith(fontSize: 12)),
                  Container(
                    width: 20,
                  ),
                  InkWell(
                    child: Hero(
                      tag: "mic",
                      child: Image.asset(
                        "assets/microphone_two.png",
                        width: 40,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, BouncyPageRoute(widget: MikePage()));
                    },
                  ),
                ],
              ),
            ),
            //Check Video
            Padding(
              padding: const EdgeInsets.all(22),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Check out your video", style: kJetMedium),
                      ],
                    ),
                    Row(
                      children: [
                        Text("your final video",
                            style: kJetMedium.copyWith(
                                fontSize: 15, color: Colors.black45)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(width: 60),
                Hero(
                  tag: "video",
                  child: Container(
                    height: 100,
                    width: 130,
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
                SizedBox(width: 30),
                Container(
                  height: 30,
                  width: 115,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 15,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text("View video", style: kJetMedium.copyWith(fontSize: 15, color: Colors.white)),
                        onTap: () {
                          Navigator.push(context, BouncyPageRoute(widget: VideoPage()));
                        },
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
