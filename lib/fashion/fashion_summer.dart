import 'package:flutter/material.dart';

import 'fashion_colorlist.dart';
import '../show_single_category.dart';
import '../menu_bar.dart';

class SummerPage extends StatefulWidget {
  const SummerPage({Key? key}) : super(key: key);

  @override
  State<SummerPage> createState() => _SummerPageState();
}

class _SummerPageState extends State<SummerPage> {
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
            showSingleCategory("#여름 쿨톤"),
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
