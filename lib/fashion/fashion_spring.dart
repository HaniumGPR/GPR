import 'package:flutter/material.dart';

import 'fashion_colorlist.dart';
import '../show_single_category.dart';
import '../menu_bar.dart';

class SpringPage extends StatefulWidget {
  const SpringPage({Key? key}) : super(key: key);

  @override
  State<SpringPage> createState() => _SpringPageState();
}

class _SpringPageState extends State<SpringPage> {
  final List<int> colorCode = [
    0xffC73E29,
    0xffE6652F,
    0xffDA895C,
    0xffF0B4B3,
    0xffF2D7C7,
    0xffFFF3B8,
    0xffAED145,
    0xffA3D8A0,
    0xff71B27A,
    0xff488A38,
    0xffC4EAD8,
    0xff7ABBCA,
    0xff3E6998
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
