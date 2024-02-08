// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.bgColor,
      body: Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset("assets/welcome avatar.jpg", width: 350),
            ),
            Container(
              width: 400,
              margin: EdgeInsets.only(top: 50),
              child: Text(
                  "Your app helps you to find a roadmap to get started in tech and provides jobs to job seekers",
                  style: TextStyle(
                      color: ColorsApp.fontColor,
                      letterSpacing: 3,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
            // Buttun
            Container(
                margin: EdgeInsets.only(top: 120),
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
                          width: 130,
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
                              fontSize: 15,
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
                          width: 130,
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
                              fontSize: 15,
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
