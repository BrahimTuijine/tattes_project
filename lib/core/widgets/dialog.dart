import 'package:flutter/material.dart';

class MyAlertDialog {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required Widget child,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(content: SingleChildScrollView(child: child));
      },
    );
  }
}