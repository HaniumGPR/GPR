import 'package:flutter/material.dart';

import 'category_widget.dart';
import 'art/art_page.dart';
import 'education/education_page.dart';
import 'fashion/fashion_page.dart';
import '../menu_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Cateogory",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 27,
              fontFamily: "Nunito Sans",
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          titleSpacing: 10,
        ),
        body: Column(
          children: <Widget>[
            CategoryWidget(
              buttonText: "#예술",
              page: ArtPage(),
            ),
            CategoryWidget(
              buttonText: "#패션",
              page: FashionPage(),
            ),
            CategoryWidget(
              buttonText: "#교육",
              page: EducationPage(),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
