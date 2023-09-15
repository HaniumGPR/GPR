import 'package:flutter/material.dart';
import 'package:hanium_gpr/main_page/main.dart';

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
                  itemCount: globalColorList.length,
                  itemBuilder: (context, index) {
                    return showColorList(globalColorList[index]);
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
                  sendRGBValues(selectedColor);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(double.infinity, double.infinity),
                ),
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
          setState(() {
            selectedColor = colorCode;
          });
          // TODO : 해당 색상이 선택되었다는 것을 시각적으로 보여주어야 함
          // 만약 a 색상이 선택된 상태에서 b 색상이 선택되었다면 -> a 색상은 선택 해제, b 색상 선택 표시
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(
          "#${colorCode.toRadixString(16).toUpperCase().substring(2)}",
          style: TextStyle(
            fontWeight:
                selectedColor == colorCode ? FontWeight.bold : FontWeight.w600,
            fontSize: selectedColor == colorCode ? 20 : 17,
            color:
                // 주어진 색상이 밝은지 어두운지 판단하여 글자색을 검정 또는 하얗게 변경
                useWhiteForeground(Color(colorCode))
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}

bool useWhiteForeground(Color color) {
  // 공식에 따라 색상의 휘도 계산
  // (0.299 * R + 0.587 * G + 0.114 * B)
  double luminance =
      (color.red * 0.299 + color.green * 0.587 + color.blue * 0.114) / 255;

  if (luminance > 0.5)
    return false; // 밝은 배경에서 어둡게 써라
  else
    return true; // 어두운 배경에서 밝게 써라
}

// 선택된 색상의 RGB값을 리스트로 변환하고 출력
void sendRGBValues(int colorCode) {
  int codeR = getColorRedValue(colorCode);
  int codeG = getColorGreenValue(colorCode);
  int codeB = getColorBlueValue(colorCode);

  List<int> rgbValues = [codeR, codeG, codeB];
  print(rgbValues);
}

int getColorRedValue(int colorValue) {
  return ((colorValue >> 16 & 0xFF));
}

int getColorGreenValue(int colorValue) {
  return ((colorValue >> 8) & 0xFF);
}

int getColorBlueValue(int colorValue) {
  return (colorValue & 0xFF);
}
