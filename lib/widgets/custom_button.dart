// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.textButton,
      required this.onPressed,
      this.buttonColor});
  final String textButton;
  VoidCallback onPressed;
  Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? Colors.blue,
      ),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
