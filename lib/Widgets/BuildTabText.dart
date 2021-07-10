import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTabText extends StatefulWidget {
  double height,width,Opacity,marginL,marginR;
  String label;
  BuildTabText(this.height,this.width,this.label,this.Opacity,this.marginL,this.marginR);
  @override
  _BuildTabTextState createState() => _BuildTabTextState();
}

class _BuildTabTextState extends State<BuildTabText> {
  @override
  Widget build(BuildContext context) {
    return   Container(
        height: widget.height.h,
        width: widget.width.w,
        alignment: Alignment.center,

        margin: EdgeInsets.only(left: widget.marginL.w,right: widget.marginR),
        child: AutoSizeText(
          ("${widget.label}"),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 17.sp,
              color: Color(0xff000000).withOpacity(widget.Opacity),
              fontWeight: FontWeight.w700),
        ));
  }
}
