import 'package:flutter/material.dart';

import '../show_single_category.dart';
import '../menu_bar.dart';
import 'education_colorlist.dart';

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
}
