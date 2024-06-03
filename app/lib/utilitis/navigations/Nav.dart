// ignore: file_names
import 'package:flutter/material.dart';

class Nav {
  static Future go(BuildContext context, Widget widget) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static back(BuildContext context, Widget widget) {
    return Navigator.pop(context);
  }

  static toReplacement(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
  }
}
