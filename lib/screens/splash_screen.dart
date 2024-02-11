// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/screens/bottom_bar_screen.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 5),
      () {
        // Check if User signin open app --> homeScreen
        // else open app --> mainScreen to log in

        FirebaseAuth.instance.currentUser == null
            ? Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              )
            : Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => homebottonbar(),
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 130.h, left: 130.w),
              child: ListTile(
                leading: LoadingAnimationWidget.horizontalRotatingDots(
                  color: ColorsApp.fontColor,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
