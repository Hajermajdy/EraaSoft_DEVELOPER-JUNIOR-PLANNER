// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/components/text_edit.dart';
import 'package:flutter_application_1/screens/edit_screen.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/helper/SP_helper.dart';

class settingUserScreen extends StatelessWidget {
  const settingUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print("Before init in setting screen ____________________");
    sp_helper.init();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                // top: 30,
                bottom: 30,
                left: 20,
                right: 20),
            padding: EdgeInsets.only(left: 50),
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsApp.mainColor),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(253, 56, 122, 122),
                            blurRadius: 1,
                            spreadRadius: 10,
                            blurStyle: BlurStyle.inner)
                      ], borderRadius: BorderRadius.circular(150)),
                      child: ClipRRect(
                          child: Image.asset("assets/user.png", width: 100),
                          borderRadius: BorderRadius.circular(150)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  sp_helper.getData(key: "name"),
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: ColorsApp.fontColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(23),
            padding: EdgeInsets.all(30),
            // decoration: BoxDecoration(boxShadow: [
            //   BoxShadow(
            //       blurRadius: 100,
            //       color: Colors.grey,
            //       spreadRadius: -40),
            // ],
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 100, color: Colors.grey, spreadRadius: -40),
              ],
              borderRadius: BorderRadius.circular(20),
              color: ColorsApp.fontColor,
            ),
            child: Column(
              children: [
                textEdit(text: "Email", icon: Icons.email),
                Divider(color: Colors.black),
                SizedBox(
                  height: 10,
                ),
                textEdit(text: "Password", icon: Icons.password),
                Divider(color: Colors.black),
                SizedBox(
                  height: 10,
                ),
                textEdit(text: "CV.pdf", icon: Icons.picture_as_pdf),
                Divider(color: Colors.black),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => editScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text("EDIT",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 5,
                              )),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            width: 170,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 100, color: Colors.grey, spreadRadius: -40),
              ],
              borderRadius: BorderRadius.circular(20),
              color: ColorsApp.fontColor,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    print("CLICK SIGNOUT");
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                        (route) => false);
                  },
                  child: textEdit(text: "LOG OUT", icon: Icons.logout_outlined),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 10,
                ),
                textEdit(text: "DARK MODE", icon: Icons.light_mode_rounded),
                Divider(color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
