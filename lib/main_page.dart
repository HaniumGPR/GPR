import 'package:flutter/material.dart';

import 'category_widget.dart';
import 'education/education_page.dart';
import 'fashion/fashion_page.dart';
import 'menu_bar.dart';
import 'art/art_page.dart';

// 메인 홈페이지

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

      // 각 카테고리에 맞는 페이지로 이동하도록 페이지 지정 -> category_widget.dart
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
    ));
  }
}
