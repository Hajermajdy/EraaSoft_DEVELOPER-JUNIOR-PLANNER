// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/components/textformfield_password.dart';
import 'package:flutter_application_1/screens/bottom_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/regular%20expresion/validationEmail.dart';

// ignore: must_be_immutable
class signupScreen extends StatelessWidget {
  TextEditingController texteditingControllerName = TextEditingController();
  TextEditingController texteditingControllerEmail = TextEditingController();
  TextEditingController texteditingControllerPassword = TextEditingController();
  TextEditingController texteditingControllerConfirmPassword =
      TextEditingController();

  late UserCredential credential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SIGNUP",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          color: ColorsApp.mainColor)),
                  SizedBox(
                    height: 20,
                  ),
                  textFormField(
                    text: "Enter Your Name",
                    icon: Icons.person,
                    texteditingController: texteditingControllerName,
                  ),
                  textFormField(
                    text: "Enter Your Email",
                    icon: Icons.email,
                    texteditingController: texteditingControllerEmail,
                  ),
                  textformfieldPassword(
                    text: "Enter Your Password",
                    icon: Icons.lock_open_rounded,
                    texteditingController: texteditingControllerPassword,
                  ),
                  textformfieldPassword(
                    text: "Conirm Password",
                    icon: Icons.lock_open_rounded,
                    texteditingController: texteditingControllerConfirmPassword,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // Firebase_Auth
                          //Check all textfields not empty
                          if (texteditingControllerName.text.isEmpty ||
                              texteditingControllerEmail.text.isEmpty ||
                              texteditingControllerPassword.text.isEmpty ||
                              texteditingControllerConfirmPassword
                                  .text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: "Please Fill All Fields",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 15,
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
                                fontSize: 15,
                                backgroundColor: ColorsApp.bgColor,
                                textColor: ColorsApp.fontColor,
                              );
                            } else if (texteditingControllerPassword.text !=
                                texteditingControllerConfirmPassword.text) {
                              Fluttertoast.showToast(
                                msg:
                                    "Confirm Password Not Match Password\n Plaese Try Again",
                                toastLength: Toast.LENGTH_LONG,
                                fontSize: 15,
                                backgroundColor: ColorsApp.bgColor,
                                textColor: ColorsApp.fontColor,
                              );
                            } else {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: texteditingControllerEmail.text,
                                  password: texteditingControllerPassword.text,
                                );
                                // // shared prefrence
                                // sp_helper.saveData(
                                //   key: "name",
                                //   value: texteditingControllerName.text,
                                // );

                                //Navigation bar
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => homebottonbar(),
                                    ),
                                    (route) => false);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  Fluttertoast.showToast(
                                    msg: "The password provided is too weak",
                                    toastLength: Toast.LENGTH_LONG,
                                    fontSize: 15,
                                    backgroundColor: ColorsApp.bgColor,
                                    textColor: ColorsApp.fontColor,
                                  );
                                } else if (e.code == 'email-already-in-use') {
                                  Fluttertoast.showToast(
                                    msg:
                                        "The account already exists for that email",
                                    toastLength: Toast.LENGTH_LONG,
                                    fontSize: 15,
                                    backgroundColor: ColorsApp.bgColor,
                                    textColor: ColorsApp.fontColor,
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          }

                          // End
                        },
                        child: Container(
                          width: 120,
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
                                Text("SIGNUP",
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
