import 'package:flutter/material.dart';

// 각 톤에 맞는 color 보여주기
Container showColorList(int colorCode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    height: 70,
    width: double.infinity,
    alignment: Alignment.center,
    color: Color(colorCode),
    child: TextButton(
      onPressed: () {},
      child: Text(
        "#" + colorCode.toRadixString(16).toUpperCase().substring(2),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.black,
          fontFamily: "Nunito Sans",
        ),
      ),
    ),
  );
}

Container select() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    height: 50,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.black87,
        width: 1,
      ),
    ),
    child: TextButton(
      onPressed: () {},
      child: Text(
        "선택 완료",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.black,
          fontFamily: "Nunito Sans",
        ),
      ),
    ),
  );
}
