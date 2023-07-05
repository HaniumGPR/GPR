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
