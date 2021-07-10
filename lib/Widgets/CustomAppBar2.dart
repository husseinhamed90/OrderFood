import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class CustomAppBar2 extends StatefulWidget {
  Widget leading;
  CustomAppBar2(this.leading);
  @override
  _CustomAppBar2State createState() => _CustomAppBar2State();
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          //height: 45.h,
          //width: 133.w,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    // height: 21.h,
                    // width: 64.w,
                    child: AutoSizeText(
                      "Delivery to",
                      style: TextStyle(
                          color: Color(0xff1C1C1C),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                  )
                ],
              ),
              CustomSizedBox(1),
              Container(
                alignment: Alignment.center,
                //height: 23.h,
                // width: 133.w,
                child: AutoSizeText(
                  "lekki phase 1, Estate",
                  style: TextStyle(
                      color: Color(0xfffe554a),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
        backgroundColor: Color(0xffF8FBFF),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 21,top: 5),
            child: Container(child: Image.asset("images/man.png"),height: 30,width: 30,)
          )
        ],
        leading:widget.leading

    );
  }
}
