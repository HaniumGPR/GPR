import 'package:flutter/material.dart';

import 'main_page.dart';

void main() {
  runApp(MainPage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Text("GPR"),
      ),
    );
  }
}
