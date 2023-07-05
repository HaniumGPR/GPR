import 'package:flutter/material.dart';

Container showSingleCategory(String category) {
  return Container(
    height: 65,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Nunito Sans",
            letterSpacing: 2.0,
          ),
        ),
      ],
    ),
  );
}
