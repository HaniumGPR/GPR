import 'package:flutter/material.dart';

import 'education_mix.dart';
import 'education_blue.dart';
import 'education_green.dart';
import 'education_red.dart';
import 'education_yellow.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';

// TODO
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
  var deviceSize, deviceWidth, deviceHeight;
  List<int> selectColor = [0xFFFFFF, 0xFFFFFF];

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    deviceWidth = deviceSize.width;
    deviceHeight = deviceSize.height;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#교육"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showColor(Colors.red, EduRedPage()),
                showColor(Colors.blue, EduBluePage()),
                showColor(Colors.yellow, EduYellowPage()),
                showColor(Colors.green, EduGreenPage()),
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
                    color: Color(selectColor[0]),
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
                    color: Color(selectColor[0]),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                  ),
                ),
              ],
            ),
            mix(), // 혼합하기 버튼
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Container showColor(Color color, Widget page) {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(''),
      ),
    );
  }

  Container mix() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 50,
      width: deviceWidth - 200,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MixPage()),
          );
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
}
