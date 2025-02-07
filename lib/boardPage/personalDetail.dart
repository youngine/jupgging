import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:jupgging/models/image.dart';
import 'package:jupgging/models/user.dart';

class PersonalDetail extends StatefulWidget {
  ImageURL imageUrl;
  User user;

  @override
  State<StatefulWidget> createState() => _PesonalDetail();
}

class _PesonalDetail extends State<PersonalDetail> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final imageUrl = ModalRoute.of(context).settings.arguments as ImageURL;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, statusBarHeight, 0, 0),
                child: Column(
                  children: [
                    Container(
                        height: screenHeight * 0.075,
                        color: const Color(0xFF88C26F),
                        child: Row(children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_outlined, color: const Color(0xFFFFFFFF),),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.02, 0, 0, 0),
                            child: Text(
                                "${(imageUrl.createTime).substring(0, 10)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
                                    )),
                          ),
                        ])),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          screenHeight * 0.02,
                          screenWidth * 0.05,
                          screenHeight * 0.01),
                      child: Container(
                        child: ImageSlideshow(
                          height: screenHeight * 0.5,
                          children: [
                            Image.network(imageUrl.mapUrl, fit: BoxFit.fill),
                            Image.network(
                              //쓰레기 사진
                              imageUrl.trashUrl,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.25,
                                    screenHeight * 0.02, 0, 0),
                                child: Text('distance'),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.25,
                                    screenHeight * 0.02, 0, 0),
                                child: Text('time'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.2,
                                    screenHeight * 0.01, 0, 0),
                                child: Text(' ${imageUrl.distance} km',
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.2,
                                    screenHeight * 0.01, 0, 0),
                                child: Text('${imageUrl.time}',
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, screenHeight * 0.03, 0, 0),
                            child: Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.9,
                              child: OutlinedButton(
                                onPressed: () {
                                  // Respond to button press
                                },
                                child:  Text('${imageUrl.comment}',
                                    style:
                                    TextStyle(fontSize: screenHeight * 0.02)),
                              ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
