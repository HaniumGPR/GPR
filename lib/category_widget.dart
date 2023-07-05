import 'package:flutter/material.dart';

// 카테고리 list로 받아서 보여줌

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    required this.buttonText,
    required this.page,
  });

  final String buttonText;
  final Widget page;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 65,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.page),
            );
          },
          child: Row(
            children: [
              Text(
                widget.buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Nunito Sans",
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ));
  }
}
