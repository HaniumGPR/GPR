import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hanium_gpr/education/education_colorlist.dart';
import 'package:hanium_gpr/education/education_detail.dart';
import 'package:hanium_gpr/education/get_color_from_list.dart';

import '../menu_bar.dart';
import '../show_single_category.dart';
import 'education_mix.dart';

// 사용자가 색상을 선택하면 selectColor가 업데이트 되어 해당 색상이 화면에 표시되도록
// 각 색들의 colorCode 변경
// 혼합버튼 클릭 -> 선택된 색상들의 혼합된 색 MixPage()로 전달
// 혼합버튼 클릭 시 선택된 색이 0~1개일 경우 메시지 표시, MixPage()로 넘어가지 않음

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
                Container(
                  margin: EdgeInsets.all(5),
                  width: (deviceWidth - 70) / 2,
                  height: deviceHeight - 400,
                  decoration: BoxDecoration(
                    color: Color(getColorFromList(selectColorList, 0)),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                  ),
                ),
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
                Container(
                  margin: EdgeInsets.all(5),
                  width: (deviceWidth - 70) / 2,
                  height: deviceHeight - 400,
                  decoration: BoxDecoration(
                    color: Color(getColorFromList(selectColorList, 1)),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              reset(),
              mix(), // 혼합하기 버튼
            ]),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
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
          showTost("선택한 색상을 초기화했습니다.");
        },
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
            showTost("색상 2개를 선택해주세요");
          }
        },
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

  void showTost(String toastMsg) {
    Fluttertoast.showToast(
        msg: toastMsg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0x66000000),
        fontSize: 15,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }
}
