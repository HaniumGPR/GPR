import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String toastMsg) {
  Fluttertoast.showToast(
      msg: toastMsg,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0x66000000),
      fontSize: 15,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
