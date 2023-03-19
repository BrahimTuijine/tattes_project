import 'package:flutter/material.dart';

class ElevButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final Color bgColor;

  const ElevButton({
    Key? key,
    required this.text,
    required this.onpressed,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
