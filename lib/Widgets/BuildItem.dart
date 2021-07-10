import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

class BuildItem extends StatefulWidget {
  @override
  _BuildItemState createState() => _BuildItemState();
}

class _BuildItemState extends State<BuildItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        height: 112.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              child: Image.network(
                  "https://disdpbee9u48n.cloudfront.net/meals/A5caKsrtuI-1582825633.jpg"),
              margin: EdgeInsets.symmetric(horizontal: 11.w, vertical: 22.h),
              height: 68.h,
              width: 78.w,
            ),
            Container(
              margin: EdgeInsets.only(top: 24.h, bottom: 10.h, right: 25.w),
              width: 110.w,
              height: 78.h,
              child: Column(
                children: [
                  Container(
                    height: 21.h,
                    width: 118.w,
                    child: AutoSizeText(
                      "The Macdonalds",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xff3D3D3D)),
                    ),
                  ),
                  CustomSizedBox(1),
                  Row(
                    children: [
                      AutoSizeText(
                        "Classic cheesburger",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color(0xff3D3D3D)),
                      ),
                      //  Spacer(),
                    ],
                  ),
                  CustomSizedBox(5),
                  Container(
                    height: 21.h,
                    width: 118.w,
                    child: AutoSizeText(
                      "\$23.99",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Color(0xffFE554A)),
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSizedBox(20),
                  Row(
                    children: [
                      Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19)),
                              color: Color(0xffF9881F)),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: AutoSizeText(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Color(0xff3D3D3D)),
                        ),
                      ),
                      Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19)),
                              color: Color(0xffF9881F)),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          )),
                    ],
                  ),
                  CustomSizedBox(13),
                  AutoSizeText(
                    "Order Again",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xffFE554A)),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
