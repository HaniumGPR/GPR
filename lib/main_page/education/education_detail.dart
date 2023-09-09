import 'package:flutter/material.dart';

import '../../menu_bar.dart';
import '../utils/show_single_category.dart';

class EduDetailPage extends StatefulWidget {
  final List<int> colorList;
  final String colorCategory;

  const EduDetailPage(
      {super.key, required this.colorList, required this.colorCategory});

  @override
  State<EduDetailPage> createState() => _EduDetailPageState();
}

class _EduDetailPageState extends State<EduDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory(widget.colorCategory),
            Expanded(
              child: ListView.builder(
                itemCount: widget.colorList.length,
                itemBuilder: (context, index) {
                  return showColorList(this.context, widget.colorList[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Container showColorList(BuildContext context, int colorCode) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 100,
      width: double.infinity,
      alignment: Alignment.center,
      color: Color(colorCode),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context, colorCode);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(''),
      ),
    );
  }
}
