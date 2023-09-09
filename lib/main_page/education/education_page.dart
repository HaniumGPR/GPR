import 'package:flutter/material.dart';

import '../../menu_bar.dart';
import '../utils/show_single_category.dart';
import '../utils/show_toast.dart';
import 'education_colorlist.dart';
import 'education_detail.dart';
import 'education_mix.dart';
import 'get_color_from_list.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  // ignore: prefer_typing_uninitialized_variables
  var deviceSize, deviceWidth, deviceHeight;
  List<int> selectColorList = [];

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    deviceWidth = deviceSize.width;
    deviceHeight = deviceSize.height;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#교육"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showColorPage(Colors.red, colorCodeRed, "#RED"),
                showColorPage(Colors.blue, colorCodeBlue, "BLUE"),
                showColorPage(Colors.yellow, colorCodeYellow, "YELLOW"),
                showColorPage(Colors.green, colorCodeGreen, "GREEN"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedColorContainer(getColorFromList(selectColorList, 0)),
                Container(
                  width: 50,
                  height: deviceHeight - 400,
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: "Nunito Sans",
                    ),
                  ),
                ),
                selectedColorContainer(getColorFromList(selectColorList, 1)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reset(),
                mix(), // 혼합하기 버튼
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Container selectedColorContainer(int colorCode) {
    return Container(
      margin: EdgeInsets.all(5),
      width: (deviceWidth - 70) / 2,
      height: deviceHeight - 400,
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
      ),
    );
  }

  Container showColorPage(Color color, List<int> colorList, String str) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 130,
      width: (deviceWidth - 40) / 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
      ),
      child: TextButton(
        onPressed: () async {
          int? selectedColor = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EduDetailPage(colorList: colorList, colorCategory: str)),
          );
          if (selectedColor != null) {
            setState(() {
              if (selectColorList.length < 2) {
                selectColorList.add(selectedColor);
              }
            });
          }
        },
        child: Text(''),
      ),
    );
  }

  Container reset() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 50,
      width: deviceWidth / 2 - 20,
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
        onPressed: () {
          setState(() {
            selectColorList.clear();
          });
          showToast("선택한 색상을 초기화했습니다.");
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(
          "초기화",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Nunito Sans",
          ),
        ),
      ),
    );
  }

  Container mix() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 50,
      width: deviceWidth / 2 - 20,
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
        onPressed: () {
          if (selectColorList.length == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MixPage(
                  selectColorList: selectColorList,
                ),
              ),
            );
          } else {
            showToast("색상 2개를 선택해주세요");
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(
          "혼합",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Nunito Sans",
          ),
        ),
      ),
    );
  }
}
