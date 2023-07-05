import 'package:flutter/material.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';
import 'education_colorlist.dart';

class EduBluePage extends StatefulWidget {
  const EduBluePage({Key? key}) : super(key: key);

  @override
  State<EduBluePage> createState() => _EduBluePageState();
}

class _EduBluePageState extends State<EduBluePage> {
  final List<int> colorCode = [
    0xff0000FF,
    0xff0033FF,
    0xff0066FF,
    0xff0099FF,
    0xff00CCFF,
    0xff66CCFF,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#BLUE"),
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
