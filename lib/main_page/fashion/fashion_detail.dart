import 'package:flutter/material.dart';
import 'package:hanium_gpr/show_toast.dart';

import '../../menu_bar.dart';
import '../../show_single_category.dart';

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
        onPressed: () {
          // TODO : 선택 <-> 해제 시각적으로 보여주어야 함
          if (selectColorList.contains(colorCode)) {
            // 이미 선택한 색상이라면 -> 선택 해제
            selectColorList.remove(colorCode);
          } else {
            selectColorList.add(colorCode);
          }
        },
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
          // TODO : db에 selectColorList 추가 -> 기존에 저장된 색상이 다시 추가된다면?
          showToast("장바구니에 선택한 색상을 추가했습니다.");
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
