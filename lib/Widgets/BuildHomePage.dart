import 'package:flutter/material.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Widgets/BuildCategoryItem.dart';
import 'package:orderfood/Widgets/BuildResturantItem.dart';

import 'SizedBox.dart';
class BuildHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async=> await AppCubit.get(context).GetAllResturants(),
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
                            "Popular restaurants",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Text(
                            "View all(29)",
                            style: TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                color: Color(0xffFF774C)),
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
                          return BuildRestirantItem(AppCubit.get(context).resturants[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 22,
                          );
                        },
                        itemCount: AppCubit.get(context).resturants.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
                //color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
