import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Screens/CategoryMealsList.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import '../Screens/Mealdetails.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Widgets/BuildCategoryItem.dart';
import 'package:orderfood/Widgets/BuildResturantItem.dart';
import 'package:sqflite/sqflite.dart';

import 'SizedBox.dart';
class BuildHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //CreateDataBase();
    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async=> await AppCubit.get(context).LoadData(),
          child: Container(
            color: Color(0xffF8FBFF),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(50),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 31,
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Enjoy Delicious food",
                      style: TextStyle(
                          color: Color(0xff3D3D3D),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  CustomSizedBox(50),
                  Container(
                    height: 110,
                    padding: EdgeInsets.only(left: 24),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return BuildCategoryItem(AppCubit.get(context).categories[index],index);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 22,
                        );
                      },
                      itemCount: AppCubit.get(context).categories.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  CustomSizedBox(50),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 10),
                    //height: 321.h,
                    child: Column(
                      children: [
                        Container(
                          height: 21,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                "Popular Meals",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryMealsList(),));
                                },
                                child: Text(
                                  "View all(${AppCubit.get(context).PopularMeals.length})",
                                  style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      color: Color(0xffFF774C)),
                                ),
                              )
                            ],
                          ),
                        ),
                        CustomSizedBox(50),
                        Container(
                          width: double.infinity,
                          height: 260,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return BuildRestirantItem(AppCubit.get(context).PopularMeals[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 22,
                              );
                            },
                            itemCount: AppCubit.get(context).PopularMeals.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
