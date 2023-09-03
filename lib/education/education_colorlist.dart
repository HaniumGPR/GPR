import 'package:flutter/material.dart';

final List<int> colorCodeRed = [
  0xffFF0000,
  0xffFF3333,
  0xffFF6666,
  0xffFF9999,
  0xffFFCCCC,
];

final List<int> colorCodeGreen = [
  0xff00FF00,
  0xff33FF33,
  0xff66FF66,
  0xff99FF99,
  0xffCCFFCC,
];

final List<int> colorCodeYellow = [
  0xffFFFF00,
  0xffFFFF33,
  0xffFFFF66,
  0xffFFFF99,
  0xffFFFFCC,
];

final List<int> colorCodeBlue = [
  0xff0000FF,
  0xff3333FF,
  0xff3366FF,
  0xff9999FF,
  0xffCCCCFF,
];

Container showColorList(BuildContext context, int colorCode) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    height: 100,
    width: double.infinity,
    alignment: Alignment.center,
    color: Color(colorCode),
    child: TextButton(
      onPressed: () {
        Navigator.pop(context, colorCode);
      },
      child: Text(''),
    ),
  );
}
