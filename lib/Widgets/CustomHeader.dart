import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomHeader extends StatefulWidget {
  String headertext;
  CustomHeader(this.headertext);
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20,),
        child: Text(
          widget.headertext,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xff1C1C1C)),
        )
    );
  }
}
