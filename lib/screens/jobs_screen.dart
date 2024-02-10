// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors/colors_app.dart';
import 'package:auto_size_text/auto_size_text.dart';

class jobScreen extends StatefulWidget {
  const jobScreen({super.key});

  @override
  State<jobScreen> createState() => _jobScreenState();
}

class _jobScreenState extends State<jobScreen> {
  final TextEditingController _searchController = TextEditingController();
  var searchValue = "";
  var list = [
    'title',
    'company',
    'location',
  ];
  String dropdownvalue = "title";
  List jobs = [];
  // CollectionReference job = FirebaseFirestore.instance.collection("jobs");

  getData() async {
    FirebaseFirestore.instance.collection("jobs").snapshots().listen((event) {
      event.docs.forEach((element) {
        setState(() {
          jobs.add(element.data());
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.bgColor,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
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
              DropdownButton(
                iconEnabledColor: ColorsApp.fontColor,
                padding: EdgeInsets.all(10),
                value: dropdownvalue,
                items: list.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(0))),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("jobs")
              .orderBy(dropdownvalue)
              .startAt([searchValue]).endAt(
                  [searchValue + "\uf8ff"]).snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount:
                  searchValue == "" ? jobs.length : snapshot.data!.docs.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                height: 210,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsApp.bgColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      searchValue == ""
                          ? jobs[index]['title']
                          : snapshot.data!.docs[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.business_center_rounded,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  searchValue == ""
                                      ? jobs[index]['company']
                                      : snapshot.data!.docs[index]['company'],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  searchValue == ""
                                      ? jobs[index]['location']
                                      : snapshot.data!.docs[index]['location'],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  searchValue == ""
                                      ? jobs[index]['salary']
                                      : snapshot.data!.docs[index]['salary'],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled_sharp,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  searchValue == ""
                                      ? jobs[index]['types']
                                      : snapshot.data!.docs[index]['types'],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorsApp.bgColor),
                      ),
                      onPressed: () {},
                      child: Text("Apply",
                          style: TextStyle(color: ColorsApp.fontColor)),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
