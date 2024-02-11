// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class textFormField extends StatelessWidget {
  IconData icon;
  String text;
  TextEditingController texteditingController;

  textFormField(
      {required this.text,
      required this.icon,
      required this.texteditingController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        child: TextField(
          controller: texteditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: ColorsApp.mainColor)),
            hintText: text,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Color(0xff739072), width: 1)),
          ),
        ),
      ),
    );
  }
}
