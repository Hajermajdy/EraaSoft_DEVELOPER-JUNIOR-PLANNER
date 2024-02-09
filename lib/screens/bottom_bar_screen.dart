// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/screens/home_Screen.dart';
import 'package:flutter_application_1/screens/jobs_screen.dart';
import 'package:flutter_application_1/screens/setting_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';

class homebottonbar extends StatefulWidget {
  const homebottonbar({super.key});

  @override
  State<homebottonbar> createState() => _homebottonbarState();
}

class _homebottonbarState extends State<homebottonbar> {
  @override
  void initState() {
    super.initState();
    // print("Before INTI___________________________");
    // sp_helper.init();
    // print("**********************");
    // print(sp_helper.getData(key: "name"));
    // print("**********************");
  }

  final items = [
    Icon(Icons.work, color: ColorsApp.fontColor),
    Icon(Icons.map, color: ColorsApp.fontColor),
    Icon(Icons.manage_accounts_sharp, color: ColorsApp.fontColor)
  ];

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (value) {
          print(value);
          setState(() {
            index = value;
          });
        },
        height: 60,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        color: ColorsApp.mainColor,
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget getSelectedWidget({index = 1}) {
    Widget widget;

    switch (index) {
      case 0:
        widget = jobScreen();
        break;
      case 1:
        widget = homeScreen();
        break;
      default:
        widget = settingUserScreen();
    }
    return widget;
  }
}
