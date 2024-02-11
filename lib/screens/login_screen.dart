import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/components/textformfield_password.dart';
import 'package:flutter_application_1/regular%20expresion/validationEmail.dart';
import 'package:flutter_application_1/screens/bottom_bar_screen.dart';
import 'package:flutter_application_1/screens/forget_passord.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class loginScreen extends StatelessWidget {
  TextEditingController texteditingControllerEmail = TextEditingController();
  TextEditingController texteditingControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 190.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LOGIN",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.mainColor,
                        letterSpacing: 5,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  textFormField(
                    text: "Enter Your Email",
                    icon: Icons.person,
                    texteditingController: texteditingControllerEmail,
                  ),
                  textformfieldPassword(
                    text: "Enter Your Password",
                    icon: Icons.lock_open_rounded,
                    texteditingController: texteditingControllerPassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => forgetPassword(),
                            ),
                          );
                        },
                        child: Text("Forget Password ?",
                            style: TextStyle(
                                color: ColorsApp.bgColor,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // Firebase_Auth
                          //Check all textfields not empty
                          if (texteditingControllerPassword.text.isEmpty ||
                              texteditingControllerEmail.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: "Please Fill All Fields",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 15.sp,
                              backgroundColor: ColorsApp.bgColor,
                              textColor: ColorsApp.fontColor,
                            );
                          } else {
                            //chech email by regular expresion
                            if (validationEmail.validateEmail(
                                    texteditingControllerEmail.text) ==
                                'Enter a valid email address') {
                              Fluttertoast.showToast(
                                msg: "Please Enter a valid email address ",
                                toastLength: Toast.LENGTH_LONG,
                                fontSize: 15.sp,
                                backgroundColor: ColorsApp.bgColor,
                                textColor: ColorsApp.fontColor,
                              );
                            } else {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: texteditingControllerEmail.text,
                                        password:
                                            texteditingControllerPassword.text);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => homebottonbar(),
                                    ),
                                    (route) => false);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  Fluttertoast.showToast(
                                    msg: 'No user found for that email ... ',
                                    toastLength: Toast.LENGTH_LONG,
                                    fontSize: 15.sp,
                                    backgroundColor: ColorsApp.bgColor,
                                    textColor: ColorsApp.fontColor,
                                  );
                                } else if (e.code == 'wrong-password') {
                                  Fluttertoast.showToast(
                                    msg:
                                        "Wrong password provided for that user \n\n Plaese Try Again",
                                    toastLength: Toast.LENGTH_LONG,
                                    fontSize: 15.sp,
                                    backgroundColor: ColorsApp.bgColor,
                                    textColor: ColorsApp.fontColor,
                                  );
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            }
                          }
                          //end
                        },
                        child: Container(
                          width: 120.w,
                          padding: EdgeInsets.only(
                              left: 17, right: 17, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 103, 136, 136),
                                Color(0xff1B4242)
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("LOGIN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.white,
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
