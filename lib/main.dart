// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/cach_helper.dart';
import 'package:flutter_application_1/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AIzaSyCsqyeXaVD7iYb041M3NUkvQjeyKk4nCWM", // paste your api key here
      appId:
          "1:695164720812:android:0157c56185fc736cbd3109", //paste your app id here
      messagingSenderId: "695164720812", //paste your messagingSenderId here
      projectId: "developer-junior-planner-b7e90",
      storageBucket:
          "developer-junior-planner-b7e90.appspot.com", //paste your project id here
    ),
  );

  sp_Helper.init();
  runApp(AppRoot());
}
