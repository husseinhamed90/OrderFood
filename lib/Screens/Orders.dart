import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/BuildTabText.dart';
import 'package:orderfood/Widgets/CustomBackButton.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Orders extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();

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
              // Expanded(
              //   child: ListView.separated(
              //     separatorBuilder: (context, index) => CustomSizedBox(20),
              //     itemBuilder: (context, index) => BuildItem(AppCubit.get(context).PopularMeals.first),
              //     itemCount: 3,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
