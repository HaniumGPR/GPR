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
    0xffEFF3B8,
    0xffC4EAD8,
    0xffCCE6EE,
    0xff4C6AB4,
    0xff7493E0,
    0xffA9BCF2,
    0xffD1DDF4,
    0xffDCD6F4,
    0xffC0AED6,
    0xff9E7DD1,
    0xffE9C7DD,
    0xffDC9FBA,
    0xffD4779C
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
