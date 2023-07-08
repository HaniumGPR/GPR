import 'package:flutter/material.dart';

import 'fashion_colorlist.dart';
import '../show_single_category.dart';
import '../menu_bar.dart';

class WinterPage extends StatefulWidget {
  const WinterPage({Key? key}) : super(key: key);

  @override
  State<WinterPage> createState() => _WinterPageState();
}

class _WinterPageState extends State<WinterPage> {
  final List<int> colorCode = [
    0xff16282F,
    0xff29536A,
    0xffB7BBBD,
    0xff3E6998,
    0xff0F1728,
    0xff1C38AD,
    0xff857874,
    0xff271311,
    0xff542F90,
    0xff2B1052,
    0xff7B3054,
    0xffCA89A5,
    0xffC9404A
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#패션"),
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
