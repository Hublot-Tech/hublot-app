import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void errorMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        timeInSecForIosWeb: 4,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void warningMessage(String msg, Color? color) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? Colors.yellow,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void successMessage(String msg, Color? color) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
