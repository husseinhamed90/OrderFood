import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Mealdetails.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Widgets/BuildCategoryItem.dart';
import 'package:orderfood/Widgets/BuildResturantItem.dart';
import 'package:sqflite/sqflite.dart';

import 'SizedBox.dart';
class BuildHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //CreateDataBase();
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
                //color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Widget BuildRestirantItem ( Meal restaurant,BuildContext context){
  //   return  InkWell(
  //     onTap: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetails(AppCubit.get(context).isMealInCart(restaurant)??restaurant)));
  //     },
  //     child: Container(
  //       padding:
  //       EdgeInsets.only(top: 15, right: 15, left: 15),
  //       height: 290,
  //       width: 200,
  //       decoration: BoxDecoration(
  //         // color: Colors.red,
  //         borderRadius: BorderRadius.circular(40),
  //       ),
  //       child: Column(
  //         children: [
  //           Container(
  //             height: 100,
  //             width: 170,
  //             child: Image.network("${restaurant.path}"),
  //             //child: Image.asset("images/burger.png"),
  //           ),
  //           CustomSizedBox(20),
  //           Container(
  //             alignment: Alignment.centerLeft,
  //             height: 21,
  //             child: Text(
  //               "${restaurant.mealname}",
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w700,
  //                 color: Color(0xff3D3D3D),
  //               ),
  //             ),
  //           ),
  //           CustomSizedBox(5),
  //           Container(
  //               alignment: Alignment.centerLeft,
  //               height: 36,
  //               child: AutoSizeText(
  //                 "${restaurant.description}",
  //                 style: TextStyle(
  //                     fontSize: 14,
  //
  //                     fontWeight: FontWeight.w400),maxLines: 2,
  //               )),
  //           Container(
  //               alignment: Alignment.centerLeft,
  //               height: 36,
  //               child: Text(
  //                 "${restaurant.mealprice}",
  //                 style: TextStyle(
  //                     fontSize: 14,
  //                     color: Color(0xff3D3D3D),
  //                     fontWeight: FontWeight.w400),
  //               )),
  //           Container(
  //             child: Row(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.only(left: 4),
  //                   child: IconButton(
  //                     icon: Icon(
  //                       Icons.star,
  //                       color: Color(0xffF5A62E),
  //                       size: 18,
  //                     ),
  //                     onPressed: () {},
  //                     padding: EdgeInsets.zero,
  //                   ),
  //                   height: 18,
  //                   width: 18,
  //
  //                   // alignment: Alignment.center,
  //                 ),
  //                 SizedBox(
  //                   width: 7,
  //                 ),
  //                 Container(
  //                   padding: const EdgeInsets.only(
  //                     top: 2,
  //                   ),
  //                   child: Text(
  //                     "4+",
  //                     style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w400),
  //                   ),
  //                   height: 18,
  //                   width: 18,
  //                 ),
  //                 Spacer(),
  //                 Container(
  //                   child: IconButton(
  //                     icon: Icon(
  //                       Icons.favorite,
  //                       color: (AppCubit.get(context).IsMealInFavourites(restaurant))?Color(0xffFE554A):Colors.black,
  //                       size: 18,
  //                     ),
  //                     onPressed: () {
  //                       if(AppCubit.get(context).IsMealInFavourites(restaurant)){
  //                         AppCubit.get(context).deleteMealFromDatabaseFavourite(restaurant);
  //                       }
  //                       else{
  //                         AppCubit.get(context).addMealToFavourite(restaurant);
  //                       }
  //                     },
  //                     padding: EdgeInsets.zero,
  //                   ),
  //                   height: 15,
  //                   width: 15,
  //                   // alignment: Alignment.center,
  //                 ),
  //               ],
  //             ),
  //             height: 27,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // late String mealname,path,description;
  // String id="";
  // double mealprice=0;
  // int quantity=0;



}
