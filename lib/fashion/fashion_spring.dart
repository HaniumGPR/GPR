import 'package:flutter/material.dart';

import 'fashion_colorlist.dart';
import '../show_single_category.dart';
import '../menu_bar.dart';

// 색상마다 선택/선택해제 표시 해야 함 -> colorlist의 onPressed() 수정해야 함
// 선택된 색상은 list에 추가, 선택해제되면 list에서 제거 -> 선택완료 버튼 누르면 DB에 저장

class SpringPage extends StatefulWidget {
  const SpringPage({Key? key}) : super(key: key);

  @override
  State<SpringPage> createState() => _SpringPageState();
}

class _SpringPageState extends State<SpringPage> {
  final List<int> colorCode = [
    0xffFFC0CB,
    0xff123456,
    0xff789101,
    0xffFFFF00,
    0xffFA5305
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#봄 웜톤"),
            Expanded(
              child: ListView.builder(
                itemCount: colorCode.length,
                itemBuilder: (context, index) {
                  return showColorList(colorCode[index]);
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
}
