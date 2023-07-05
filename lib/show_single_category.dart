import 'package:flutter/material.dart';

// 각 페이지 상단에 해당 카테고리 보여주는 container

Container showSingleCategory(String category) {
  return Container(
    height: 65,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      category,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.white,
        fontFamily: "Nunito Sans",
        letterSpacing: 2.0,
      ),
    ),
  );
}
