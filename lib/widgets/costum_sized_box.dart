import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSizeBox extends StatelessWidget {
  CustomSizeBox({super.key, this.height, this.width});

  double? height = 0;
  double? width = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
