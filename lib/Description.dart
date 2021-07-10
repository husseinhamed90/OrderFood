import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Description extends StatefulWidget {
  String text;
  Description(this.text);
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 287.w,
        padding: EdgeInsets.only(left: 44),
        child: Text(widget.text,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff3D3D3D)),
        )
    );
  }
}
