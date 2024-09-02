import 'package:app/configuration.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void errorConnection(String msg, Color? color, BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9).r,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('img/Group 140.png'),
            Flexible(
              child: Column(
                children: [
                  Row(
                    children: [
                      textPresentation(
                          msg: 'Desoler une ',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: Colors.white),
                      textPresentation(
                          msg: ' erreur s’est produite !!! ',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: Colors.white),
                    ],
                  ),
                  textPresentation(
                      msg:
                          "Ressayer à present... Et decouvrez comment vivre de votre passion sur hublots...",
                      fontWeight: FontWeight.normal,
                      size: 11,
                      color: Colors.white),
                ],
              ),
            ),
          ],
        ));
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: toastDuration,
    );
  }

  static void errorMessage(String msg, BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9).r,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("img/Group 140.png"),
          const SizedBox(width: 10),
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: textPresentation(
                  textAlign: TextAlign.start,
                  msg: msg,
                  fontWeight: FontWeight.normal,
                  size: 11,
                  color: Colors.white),
            ),
          )
        ]));
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: toastDuration,
    );
  }

  static void warningMessage(String msg, Color? color) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? Colors.yellow,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void successMessage(String msg, Color? color, BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("img/Group 139.png"),
          const SizedBox(width: 10),
          Flexible(
            child: textPresentation(
                msg: msg,
                fontWeight: FontWeight.normal,
                size: 11,
                color: Colors.white),
          )
        ]));
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: toastDuration,
    );
  }

  static void sucessConnection(String msg, Color? color, BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Row(
          children: [
            Image.asset("img/Group 139.png"),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      textPresentation(
                          msg: 'Bravo pour votre ',
                          fontWeight: FontWeight.w600,
                          size: 16.sp,
                          color: Colors.white),
                      textPresentation(
                          msg: 'connexion !!!',
                          fontWeight: FontWeight.w600,
                          size: 16.sp,
                          color: kyellowColor),
                    ],
                  ),
                  textPresentation(
                      textAlign: TextAlign.start,
                      msg:
                          "L’adventure commence...\n Decouvrez comment vivre de votre passion sur hublots...",
                      fontWeight: FontWeight.normal,
                      size: 11.sp,
                      color: Colors.white),
                ],
              ),
            ),
          ],
        ));
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: toastDuration,
    );
  }
}
