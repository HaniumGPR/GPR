import 'package:flutter/material.dart';
import 'package:hanium_gpr/main_page/main.dart';
import 'package:hanium_gpr/main_page/utils/show_toast.dart';

import '../../menu_bar.dart';
import '../utils/show_single_category.dart';

class MixPage extends StatefulWidget {
  final List<int> selectColorList;

  const MixPage({super.key, required this.selectColorList});

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
  // ignore: prefer_typing_uninitialized_variables
  var deviceSize, deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    deviceHeight = deviceSize.height;
    var mixedColor = getMixedColor(widget.selectColorList);

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
                color: Color(mixedColor),
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
                onPressed: () {
                  if (globalColorList.contains(mixedColor)) {
                    showToast("장바구니에 존재하는 색상입니다.");
                  } else {
                    globalColorList.add(mixedColor);
                    showToast("장바구니에 색상을 추가했습니다.");
                  }
                  Navigator.pop(context);
                  // TODO : mixedColor DB에 추가
                },
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

int getMixedColor(List<int> selectColorList) {
  int alphaSum = 0;
  int redSum = 0;
  int greenSum = 0;
  int blueSum = 0;

  for (int color in selectColorList) {
    alphaSum += (color >> 24) & 0xFF;
    redSum += (color >> 16) & 0xFF;
    greenSum += (color >> 8) & 0xFF;
    blueSum += color & 0xFF;
  }

  int alphaAvg = alphaSum ~/ 2;
  int redAvg = redSum ~/ 2;
  int greenAvg = greenSum ~/ 2;
  int blueAvg = blueSum ~/ 2;

  int mixedColor =
      (alphaAvg << 24) | (redAvg << 16) | (greenAvg << 8) | blueAvg;

  return mixedColor;
}
