import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  final ontap;
  String buttonname;

  CustomAppBar(this.ontap,this.buttonname);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xffF8FBFF),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: (28)),
        child: Image.asset("images/logo.png",height: 23,width: 34,),
      ),
      actions: [
        InkWell(
          onTap: widget.ontap,
          child: Padding(
            padding: EdgeInsets.only(right: 30,top: 28),
            child: Container(
             // width: 60.w,
              height: 24.h,
              alignment: Alignment.center,
              //padding: EdgeInsets.only(right: 30.w),
              child: Text(widget.buttonname,style: TextStyle(
                  color: Color(0xffFA5A1E),fontSize: 16.sp,fontWeight: FontWeight.w600,decoration: TextDecoration.underline
              ),),
            ),
          ),
        )
      ],
    );
  }
}
