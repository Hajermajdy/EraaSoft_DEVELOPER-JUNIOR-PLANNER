// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class editScreen extends StatelessWidget {
  TextEditingController texteditingControllerName = TextEditingController();
  TextEditingController texteditingControllerEmail = TextEditingController();
  TextEditingController texteditingControllerPassword = TextEditingController();

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
          child:
              Icon(Icons.keyboard_arrow_left_sharp, color: ColorsApp.fontColor),
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(0),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                child: Image.asset("assets/user.png", width: 100),
                borderRadius: BorderRadius.circular(150)),
            SizedBox(
              height: 10,
            ),
            textFormField(
              icon: Icons.person,
              text: "sp_helper.getData(key: name)",
              texteditingController: texteditingControllerName,
            ),
            textFormField(
              icon: Icons.email,
              text: ' ',
              texteditingController: texteditingControllerEmail,
            ),
            textFormField(
              icon: Icons.password,
              text: ' ',
              texteditingController: texteditingControllerPassword,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorsApp.bgColor),
                    ),
                    onPressed: () async {
                      // sp_helper.updateDate(
                      //     key: "name", value: texteditingControllerName.text);
                      Fluttertoast.showToast(
                        msg: 'Data Saved',
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 15,
                        backgroundColor: ColorsApp.bgColor,
                        textColor: ColorsApp.fontColor,
                      );
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => editScreen(),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: ColorsApp.fontColor,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorsApp.fontColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancle",
                    style: TextStyle(
                      color: ColorsApp.bgColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
