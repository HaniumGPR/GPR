import 'package:flutter/material.dart';

import '../menu_bar.dart';

// colorCode -> DB에서 불러와야 함
// 색상출력 버튼 - onPressed

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  // ignore: prefer_typing_uninitialized_variables
  var deviceSize, deviceHeight;
  var selectedColor = -1;

  List<int> colorCode = [
    0xffFFFF99,
    0xffCCFFCC,
    0xffCCCCFF,
    0xff6600FF,
    0xffFF00FF,
    0xffFF6666,
    0xffFF00DD,
    0xffFF007F,
    0xff3300FF,
  ];

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    deviceHeight = deviceSize.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 27,
              fontFamily: "Nunito Sans",
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          titleSpacing: 10,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: deviceHeight - 250,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black87,
                  width: 1,
                ),
              ),
              child: Expanded(
                child: ListView.builder(
                  itemCount: colorCode.length,
                  itemBuilder: (context, index) {
                    return showColorList(colorCode[index]);
                  },
                ),
              ),
            ),
            Container(
              height: 55,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  // TODO : RGB 전달
                  separateToRGB(selectedColor);
                },
                child: Text(
                  "색상 출력",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Nunito Sans",
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Container showColorList(int colorCode) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      color: Color(colorCode),
      child: TextButton(
        onPressed: () {
          // TODO : 해당 색상이 선택되었다는 것을 시각적으로 보여주어야 함
          // 만약 a 색상이 선택된 상태에서 b 색상이 선택되었다면 -> a 색상은 선택 해제, b 색상 선택 표시
          selectedColor = colorCode;
        },
        child: Text(
          "#${colorCode.toRadixString(16).toUpperCase().substring(2)}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

List<int> separateToRGB(int colorCode) {
  int codeR = (colorCode >> 16) & 0xFF;
  int codeG = (colorCode >> 8) & 0xFF;
  int codeB = (colorCode) & 0xFF;
  return [codeR, codeG, codeB];
}
