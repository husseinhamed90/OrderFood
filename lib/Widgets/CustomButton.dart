import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  Color buttonColor;
  String buttonText;
  final buttonFunction;
  TextStyle textStyle;
  double width;
  CustomButtom({required this.buttonColor, required this.buttonFunction, required this.textStyle, required this.buttonText,required this.width});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        height: 45,
        width: width,
        alignment: Alignment.center,
        child: Text(buttonText,style: textStyle),
        //padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      ),
    );
  }
}
