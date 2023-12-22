import 'package:flutter/material.dart';

class MyAlertDialog {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required Widget child,
    Widget? title,
    List<Widget>? actions,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: title,
          actions: actions,
          content: SingleChildScrollView(child: child),
        );
      },
    );
  }
}
