import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomSizedBox extends StatelessWidget {
  double height;
  CustomSizedBox(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
