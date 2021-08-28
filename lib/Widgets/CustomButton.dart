import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButtom extends StatelessWidget {
  Color buttoncolor;
  String Buttontext;
  final buttonFunction;
  TextStyle textStyle;
  double width;
  CustomButtom({required this.buttoncolor, required this.buttonFunction, required this.textStyle, required this.Buttontext,required this.width});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        height: 45,
        width: width,
        alignment: Alignment.center,
        child: Text(Buttontext,style: textStyle),
        //padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      ),
    );
  }
}
