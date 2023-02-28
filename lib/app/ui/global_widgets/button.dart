import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  final Function() onPressed;
  final Color textColor;
  final Color buttonColor;
  final String text;

  const ButtonWidgets({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 358,
      child: MaterialButton(
          onPressed: onPressed,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          )),
    );
  }
}
