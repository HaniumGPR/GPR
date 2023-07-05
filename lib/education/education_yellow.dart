import 'package:flutter/material.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';
import 'education_colorlist.dart';

class EduYellowPage extends StatefulWidget {
  const EduYellowPage({Key? key}) : super(key: key);

  @override
  State<EduYellowPage> createState() => _EduYellowPageState();
}

class _EduYellowPageState extends State<EduYellowPage> {
  final List<int> colorCode = [
    0xffFFB400,
    0xffFFC314,
    0xffFFCD28,
    0xffFFDC3C,
    0xffFFF064,
    0xffFFFF96,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#YELLOW"),
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
