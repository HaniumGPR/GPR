import 'dart:io';

import 'package:flutter/material.dart';

import '../menu_bar.dart';

// 이미지 크기 300*300으로 함

// colorCode -> 사진 색상 분석 후 colorCode 업데이트
// 장바구니 버튼 -> 해당 색상 장바구니에 추가

class ArtPagewithImg extends StatefulWidget {
  const ArtPagewithImg({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ArtPagewithImg> createState() => _ArtPagewithImgState();
}

class _ArtPagewithImgState extends State<ArtPagewithImg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            _showPhoto(),
            SizedBox(height: 10),
            Expanded(
              child: _showColors(),
            )
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  // 선택한 사진 보여주기
  Widget _showPhoto() {
    return Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.file(
            File(widget.imagePath),
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }

  // 해당 이미지에 사용된 색상 보여주기
  Widget _showColors() {
    final List<int> colorCode = [
      0xffFF0000,
      0xffFF5E00,
      0xffFFE400,
      0xff1FDA11,
      0xff0900EF,
      0xff6600FF,
      0xffFF00DD,
    ];
    return ListView.builder(
        itemCount: colorCode.length,
        itemBuilder: (context, index) {
          return useColors(colorCode[index]);
        });
  }

  Container useColors(int colorCode) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.black,
      )),
      height: 100,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: colorCodeContainer(colorCode),
    );
  }

  // ignore: non_constant_identifier_names
  Column colorCodeContainer(int colorCode) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "사용 색상",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black,
              fontFamily: "Nunito Sans",
            ),
          ),
        ),
        Row(
          children: [
            Container(
              height: 45,
              width: 300,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(colorCode),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black87,
                    width: 1,
                  )),
              child: Text(
                "#${colorCode.toRadixString(16).toUpperCase().substring(2)}", // 색상 코드 보여주기
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Nunito Sans",
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // 장바구니 아이콘 -> 색상 추가 기능 구현 필요
            TextButton(
                onPressed: () {
                  // 클릭하면 해당 colorCode 장바구니에 추가되도록 -> DB에 넘겨주기
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 40,
                  color: Colors.black,
                ))
          ],
        )
      ],
    );
  }
}
