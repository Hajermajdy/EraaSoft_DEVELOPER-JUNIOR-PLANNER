// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/helper/SP_helper.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  List _items = [];

  // load job data from file json and upload in firebase

  addData() async {
    final String response = await rootBundle.loadString('lib/data/jobs.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"];
      print("..number of items ${_items.length}");
    });

    CollectionReference val = FirebaseFirestore.instance.collection("jobs");

    Future<void> countProducts() async {
      AggregateQuerySnapshot query = await val.count().get();
      print(query.count);
      print("___________Count___________");
      if (query.count == 1) {
        for (var i = 0; i < _items.length; i++) {
          val.add({
            "title": _items[i]["title"],
            "company": _items[i]["company"],
            "salary": _items[i]["salary"],
            "rating": _items[i]["rating"],
            "review_count": _items[i]["review_count"],
            "types": _items[i]["types"],
            "location": _items[i]["location"],
          });
        }
      }
    }

    countProducts();
  }

  @override
  void initState() {
    super.initState();

    //call fun
    print("2*************");
    addData();
    // Check if user sign in or sign out
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('_________User is currently signed out!_________');
      } else {
        print('_________User is signed in!_________');
      }
    });
    // shered prefrence
    sp_helper.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashScreen(),
    );
  }
}
