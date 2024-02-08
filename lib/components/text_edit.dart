// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class textEdit extends StatelessWidget {
  String text;
  IconData icon;

  textEdit({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        SizedBox(
          width: 10,
        ),
        Icon(
          icon,
          size: 16,
        ),
      ],
    );
  }
}
