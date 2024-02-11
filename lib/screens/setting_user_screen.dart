// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:flutter_application_1/components/text_edit.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/src/app_root.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_app_file/open_app_file.dart';

class settingUserScreen extends StatefulWidget {
  const settingUserScreen({super.key});

  @override
  State<settingUserScreen> createState() => _settingUserScreenState();
}

class _settingUserScreenState extends State<settingUserScreen>
    with WidgetsBindingObserver {
  PlatformFile? file;
  late bool upload = false;
  // String username = sp_Helper.getData(key: "name");

  picksinglefile() async {
    print(file == null);
    print("_______Check___________");
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;

      file == null ? false : OpenAppFile.open(file!.path.toString());

      final path = 'CV/${file?.name}';
      final FinalFile = File(file!.path!);
      final ref = FirebaseStorage.instance.ref(path);
      await ref.putFile(FinalFile);
      print("___________DONE UPLOAD___________");
      setState(() {
        upload = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // print(sp_Helper.getData(key: "name"));
    // print("Done___________");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              // top: 30,
              bottom: 30.h,
              left: 20.w,
              right: 20.w,
            ),
            padding: EdgeInsets.only(left: 50),
            height: 130.h,
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
                          child: Image.asset("assets/user.png", width: 100.w),
                          borderRadius: BorderRadius.circular(150)),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 16,
                ),
                Text(
                  " ",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp,
                      color: ColorsApp.fontColor),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(23.w),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 100, color: Colors.grey, spreadRadius: -40),
              ],
              borderRadius: BorderRadius.circular(20),
              // color: ColorsApp.fontColor,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    picksinglefile();
                  },
                  child: textEdit(
                      text: upload ? file!.name : "UPLOAD CV ..",
                      icon: Icons.picture_as_pdf),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            width: 170.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 100, color: Colors.grey, spreadRadius: -40),
              ],
              borderRadius: BorderRadius.circular(20),
              // color: ColorsApp.fontColor,
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
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    AppRoot.of(context).changeTheme(ThemeMode.dark);
                  },
                  child: textEdit(text: "Dark Mode", icon: Icons.dark_mode),
                ),
                Divider(color: Colors.black),
                GestureDetector(
                  onTap: () {
                    AppRoot.of(context).changeTheme(ThemeMode.light);
                  },
                  child: textEdit(
                      text: "Ligth Mode", icon: Icons.light_mode_rounded),
                ),
                Divider(color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
