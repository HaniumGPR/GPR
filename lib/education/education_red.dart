import 'package:flutter/material.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';
import 'education_colorlist.dart';

class EduRedPage extends StatefulWidget {
  const EduRedPage({Key? key}) : super(key: key);

  @override
  State<EduRedPage> createState() => _EduRedPageState();
}

class _EduRedPageState extends State<EduRedPage> {
  final List<int> colorCode = [
    0xffEB0000,
    0xffEB4646,
    0xffEB5A5A,
    0xffEB6262,
    0xffEB8282,
    0xffF5A0A0,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#RED"),
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
