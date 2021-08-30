import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 26, top: 35),
        child: Container(
          //padding: EdgeInsets.only(left: 26,top: 52),
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
            )),
      ),
    );
  }
}
