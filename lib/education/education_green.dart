import 'package:flutter/material.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';
import 'education_colorlist.dart';

class EduGreenPage extends StatefulWidget {
  const EduGreenPage({Key? key}) : super(key: key);

  @override
  State<EduGreenPage> createState() => _EduGreenPageState();
}

class _EduGreenPageState extends State<EduGreenPage> {
  final List<int> colorCode = [
    0xff22741C,
    0xff2F9D27,
    0xff47C83E,
    0xff1FDA11,
    0xff86E57F,
    0xffB7F0B1,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#GREEN"),
            Expanded(
              child: ListView.builder(
                itemCount: colorCode.length,
                itemBuilder: (context, index) {
                  return showColorList(colorCode[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
