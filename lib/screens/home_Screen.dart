// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchValue = "";

  List roadMaps = [];

  getData() async {
    FirebaseFirestore.instance
        .collection("RoadMaps")
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        setState(() {
          roadMaps.add(element.data());
        });
      });
    });
  }

  Future<void> _openURL(path) async {
    Uri uri = Uri.parse(path);
    print(path);
    try {
      if (await canLaunch(uri.toString())) {
        print("Launching...");
        await launch(uri.toString());
        print("Done");
      } else {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  // _launchURL(Uri path) async {
  //   if (await canLaunchUrl(path)) {
  //     await launchUrl(path);
  //   } else {
  //     throw 'Could not launch $path';
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    print("________________________");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.bgColor,
        title: Container(
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchValue = value;
                print(searchValue);
                print("__________________________");
              });
            },
            controller: _searchController,
            style: TextStyle(
              color: ColorsApp.fontColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: ColorsApp.fontColor),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: IconButton(
                icon: Icon(Icons.search, color: ColorsApp.fontColor),
                onPressed: () {},
              ),
            ),
          ),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(0))),
      ),
      body: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            // top: 0,
            bottom: 15,
            left: 20,
            right: 20,
          ),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("RoadMaps")
                .orderBy("name")
                .startAt([searchValue]).endAt(
                    [searchValue + "\uf8ff"]).snapshots(),
            builder: (context, snapshot) {
              return GridView.builder(
                itemCount: searchValue == ""
                    ? roadMaps.length
                    : snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // var roadMaps = snapshot.data?.docs;
                  return GestureDetector(
                    onTap: () => _openURL(roadMaps[index]["link"]),
                    child: Container(
                      width: 220,
                      height: 240,
                      margin: EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 100,
                            color: Colors.grey,
                            spreadRadius: -40),
                      ], borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              searchValue == ""
                                  ? roadMaps[index]["image"]
                                  : snapshot.data!.docs[index]["image"],
                              width: 130,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: ColorsApp.bgColor,
                            ),
                            width: 130,
                            height: 29,
                            child: Text(
                                searchValue == ""
                                    ? roadMaps[index]["name"]
                                    : snapshot.data!.docs[index]["name"],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: ColorsApp.fontColor)),
                          )
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              );
            },
          )),
    );
  }
}
