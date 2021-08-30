import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Meal.dart';

// ignore: must_be_immutable
class BuildItem extends StatelessWidget {
  Meal currentmeal;
  BuildItem(this.currentmeal);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Container(
            margin: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            height: 110,
            width: double.maxFinite,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(30.r)),
            ),
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) =>Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),


                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    child: Image.network(
                        "${currentmeal.path}"),

                    height: constraints.maxHeight,
                    width: constraints.maxWidth*0.25,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                      //margin: EdgeInsets.only(top: 24.h, bottom: 10.h, right: 25.w),
                      height: constraints.maxHeight,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              // height: (constraints.maxHeight-20),
                              //width: 118.w,
                              child: AutoSizeText(
                                "${currentmeal.mealname}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color(0xff3D3D3D)),overflow: TextOverflow.ellipsis,
                              ),

                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "${currentmeal.description}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff3D3D3D)),maxLines: 2,overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              //width: 118.w,
                              child: AutoSizeText(
                                "\$${currentmeal.mealprice}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color(0xffFE554A)),
                              ),
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth*0.2,

                    margin: EdgeInsets.only(top: 10,bottom: 10,right: 10),
                    //padding: EdgeInsets.only(right: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //CustomSizedBox(20),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  AppCubit.get(context).incrementCartNumber(currentmeal);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: constraints.maxHeight*0.3,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: constraints.maxHeight*0.3,
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  currentmeal.quantity.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Color(0xff3D3D3D)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  AppCubit.get(context).decreaseCartNumber(currentmeal,currentmeal.quantity);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  height: constraints.maxHeight*0.3,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
