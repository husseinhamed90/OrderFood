import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/BuildTabText.dart';
import 'package:orderfood/Widgets/CustomBackButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

class Orders extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffF8FBFF),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomBackButton(),
              CustomSizedBox(48),
              CustomHeader("Your orders"),
              CustomSizedBox(36),
              Row(
                children: [
                  BuildTabText(21,138,"Complete orders",1,31,0),
                  Spacer(),
                  BuildTabText(21,124,"Pending orders",0.5,0,37),
                ],
              ),
              CustomSizedBox(38),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => CustomSizedBox(20),
                  itemBuilder: (context, index) => BuildItem(),
                  itemCount: 3,
                ),
              )
            ],
          ),
        ),
      ),
      //appBar: AppBar(),
    );
  }
}
