import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onpressed;
  final Color buttonColor;
  final String text;
  final Color textColor;
  const ButtonWidget(
      {super.key,
      required this.onpressed,
      required this.text,
      required this.textColor,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: Get.width,
      onPressed: onpressed,
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    ).marginOnly(left: 15, right: 15, top: 15);
  }
}
