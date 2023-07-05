import 'package:flutter/material.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';

// colorCode : 합쳐진 색

// TODO
// 장바구니 담기 버튼 클릭시 colorCode 장바구니에 추가(DB에 저장)

class MixPage extends StatefulWidget {
  const MixPage({Key? key}) : super(key: key);

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
  var deviceSize, deviceHeight;
  var colorCode = 0xffFF99CC;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    deviceHeight = deviceSize.height;

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#예술"),
            Container(
              height: deviceHeight - 250,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(colorCode),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black87,
                  width: 1,
                ),
              ),
            ),
            Container(
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
                onPressed: () {}, // 버튼을 누르면 해당 색상 장바구니에 추가
                child: Text(
                  "장바구니 담기",
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
}
