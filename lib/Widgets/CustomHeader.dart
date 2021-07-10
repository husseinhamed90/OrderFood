import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff1C1C1C)),
        )
    );
  }
}
