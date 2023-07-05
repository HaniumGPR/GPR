import 'package:flutter/material.dart';

Container showColorList(int colorCode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    height: 100,
    width: double.infinity,
    alignment: Alignment.center,
    color: Color(colorCode),
    child: TextButton(
      onPressed: () {},
      child: Text(''),
    ),
  );
}
