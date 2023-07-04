import 'package:flutter/material.dart';

import 'category_widget.dart';
import 'menu_bar.dart';
import 'art_page.dart';

// 메인페이지 구성

void main() {
  runApp(ArtPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["#예술", "#패션", "#교육"];
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
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String cat = categories[index];
          return CategoryWidget(category: cat);
        },
      ),
      bottomNavigationBar: CustomNavigationBar(),
    ));
  }
}
