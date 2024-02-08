// ignore_for_file: camel_case_types

import 'package:flutter_application_1/screens/bottom_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';

// ignore: must_be_immutable
class detailsTrack extends StatelessWidget {
  String pathImage;
  String titleOfTrack;

  detailsTrack({required this.pathImage, required this.titleOfTrack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.bgColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => homebottonbar(),
                ));
          },
          child: Icon(Icons.arrow_back_ios_new_rounded,
              color: ColorsApp.fontColor),
        ),
        title: Text(titleOfTrack, style: TextStyle(color: ColorsApp.fontColor)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text("RoadMap Of ${titleOfTrack}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              // borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.asset(
                "assets/VuejsRoadmap.png",
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
