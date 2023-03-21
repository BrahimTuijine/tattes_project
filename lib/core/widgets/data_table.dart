import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/custom_text.dart';

class DataTable2SimpleDemo extends HookWidget {
  const DataTable2SimpleDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              CustomText(
                text: 'Available clients ',
                color: Colors.grey,
                size: 20,
                weight: FontWeight.w600,
              ),
            ],
          )),
    ));
  }
}
