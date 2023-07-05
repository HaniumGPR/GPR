import 'package:flutter/material.dart';

import 'fashion_autumn.dart';
import 'fashion_spring.dart';
import 'fashion_summer.dart';
import 'fashion_winter.dart';
import '../show_single_category.dart';
import '../menu_bar.dart';

// TODO
// 각 톤 별로 색상 변경 or 이미지 추가
// 각 톤의 색상코드 변경하기
// 색상마다 선택/선택해제 표시 -> fashion_colorlist의 onPressed() 수정
// 선택된 색상은 list에 추가, 선택해제되면 list에서 제거 -> 선택완료 버튼 누르면 장바구니에 추가(DB에 저장)

class FashionPage extends StatefulWidget {
  const FashionPage({Key? key}) : super(key: key);

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  var deviceSize, deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    deviceHeight = deviceSize.height;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#패션"),
            fashionTone("봄 웜톤", SpringPage()),
            fashionTone("여름 쿨톤", SummerPage()),
            fashionTone("가을 웜톤", AutumnPage()),
            fashionTone("겨울 쿨톤", WinterPage()),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Container fashionTone(String tone, Widget page) {
    return Container(
        width: double.infinity,
        height: (deviceHeight - 320) / 4,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          // Color(색상 코드)로 변경 필요
          color: Colors.yellow,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Container(
            width: 100,
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black87,
                width: 1,
              ),
            ),
            child: Text(
              tone, // 색상 코드 보여주기
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.black,
                fontFamily: "Nunito Sans",
                letterSpacing: 0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
