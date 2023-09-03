import 'package:flutter/material.dart';

import '../menu_bar.dart';
import '../show_single_category.dart';

class FashionDetailPage extends StatefulWidget {
  final List<int> colorList;
  final String colorSeason;

  const FashionDetailPage(
      {super.key, required this.colorList, required this.colorSeason});

  @override
  State<FashionDetailPage> createState() => _FashionDetailPageState();
}

class _FashionDetailPageState extends State<FashionDetailPage> {
  List<int> selectColorList = []; // 사용자가 선택한 색상 저장

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory(widget.colorSeason),
            Expanded(
              child: ListView.builder(
                itemCount: widget.colorList.length,
                itemBuilder: (context, index) {
                  return showColorList(widget.colorList[index]);
                },
              ),
            ),
            select(),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

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
          "#${colorCode.toRadixString(16).toUpperCase().substring(2)}",
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
        onPressed: () {
          // db에 색상 추가
          Navigator.pop(context);
        },
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
}
