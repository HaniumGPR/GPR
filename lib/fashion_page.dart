import 'package:flutter/material.dart';
import 'package:hanium_gpr/show_single_category.dart';

import 'menu_bar.dart';

class FashionPage extends StatefulWidget {
  const FashionPage({Key? key}) : super(key: key);

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#패션"),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
