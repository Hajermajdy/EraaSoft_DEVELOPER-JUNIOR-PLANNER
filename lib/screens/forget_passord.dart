import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _foretPasswordState();
}

class _foretPasswordState extends State<forgetPassword> {
  TextEditingController texteditingControllerEmail = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    texteditingControllerEmail.dispose();
    super.dispose();
  }

  Future<void> paswordRestart() async {
    try {
      print("Try");
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: texteditingControllerEmail.text);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password Rest Link send! Please Check Email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print("catch");
      print(e);
      Fluttertoast.showToast(
        msg: e.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        fontSize: 15,
        backgroundColor: ColorsApp.bgColor,
        textColor: ColorsApp.fontColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.bgColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorsApp.fontColor,
          ),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(0))),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormField(
              text: "Enter Your Email",
              icon: Icons.person,
              texteditingController: texteditingControllerEmail,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                print("click");
                paswordRestart();
              },
              child: Container(
                width: 190,
                height: 60,
                padding:
                    EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 103, 136, 136),
                      Color(0xff1B4242)
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Resst Password",
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
      ),
    );
  }
}
