import 'package:flutter/material.dart';

import 'fashion_colorlist.dart';
import '../show_single_category.dart';
import '../menu_bar.dart';

class AutumnPage extends StatefulWidget {
  const AutumnPage({Key? key}) : super(key: key);

  @override
  State<AutumnPage> createState() => _AutumnPageState();
}

class _AutumnPageState extends State<AutumnPage> {
  final List<int> colorCode = [
    0xff29536A,
    0xff8BC4CC,
    0xff6D8A8C,
    0xff847356,
    0xffA3D8A0,
    0xff597229,
    0xff96752E,
    0xffD8B73D,
    0xffEFC8AB,
    0xffDA895C,
    0xff893428
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#가을 웜톤"),
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
