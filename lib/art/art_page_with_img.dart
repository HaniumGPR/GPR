import 'dart:io';

import 'package:flutter/material.dart';

import '../menu_bar.dart';

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
            ),
            completeBtn(context),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Container completeBtn(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "완료",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Nunito Sans",
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }

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

  // TODO : 해당 이미지에 사용된 색상 보여주기 -> colorCodeList
  Widget _showColors() {
    List<int> colorCodeList = [
      0xffFF0000,
      0xffFF5E00,
      0xffFFE400,
      0xff1FDA11,
      0xff0900EF,
      0xff6600FF,
      0xffFF00DD,
    ];
    return ListView.builder(
      itemCount: colorCodeList.length,
      itemBuilder: (context, index) {
        return useColors(colorCodeList[index]);
      },
    );
  }

  Container useColors(int colorCode) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
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
                ),
              ),
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
            TextButton(
              onPressed: () {
                // TODO : 클릭하면 해당 colorCode DB에 저장
              },
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}
