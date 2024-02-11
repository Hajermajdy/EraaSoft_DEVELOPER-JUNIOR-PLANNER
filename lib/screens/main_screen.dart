// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 70.h),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset("assets/welcome avatar.jpg", width: 280.w),
            ),
            Container(
              width: 320.w,
              margin: EdgeInsets.only(top: 50.h),
              child: Text(
                  "Your app helps you to find a roadmap to get started in tech and provides jobs to job seekers",
                  style: TextStyle(
                      color: ColorsApp.fontColor,
                      letterSpacing: 3,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500)),
            ),
            // Buttun
            Container(
                margin: EdgeInsets.only(top: 100.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Button login
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginScreen()));
                      },
                      child: Container(
                          width: 130.w,
                          padding: EdgeInsets.only(
                              left: 17, right: 17, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: ColorsApp.fontColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsApp.mainColor,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    // Button signup
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signupScreen()));
                      },
                      child: Container(
                          width: 130.w,
                          padding: EdgeInsets.only(
                              left: 17, right: 17, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: ColorsApp.mainColor,
                            border: Border.all(color: ColorsApp.fontColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
