import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Mealdetails.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class BuildRestirantItem extends StatelessWidget {
  Meal restaurant;
  BuildRestirantItem(this.restaurant);
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        print("done done done");
        print(AppCubit.get(context).account!.mapOfFavouritesMeals.length);
        return  InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetails(restaurant)));
          },
          child: Container(
            padding:
            EdgeInsets.only(top: 15, right: 15, left: 15),
            height: 290,
            width: 200,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 170,
                  child: Image.network("${restaurant.path}"),
                  //child: Image.asset("images/burger.png"),
                ),
                CustomSizedBox(20),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 21,
                  child: Text(
                    "${restaurant.mealname}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff3D3D3D),
                    ),
                  ),
                ),
                CustomSizedBox(5),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 36,
                    child: AutoSizeText(
                      "${restaurant.description}",
                      style: TextStyle(
                          fontSize: 14,

                          fontWeight: FontWeight.w400),maxLines: 2,
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 36,
                    child: Text(
                      "${restaurant.mealprice}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff3D3D3D),
                          fontWeight: FontWeight.w400),
                    )),
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: IconButton(
                          icon: Icon(
                            Icons.star,
                            color: Color(0xffF5A62E),
                            size: 18,
                          ),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                        ),
                        height: 18,
                        width: 18,
                        // alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        child: Text(
                          "4+",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        height: 18,
                        width: 18,
                      ),
                      Spacer(),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: (AppCubit.get(context).isMealInFavourites(restaurant))?Color(0xffFE554A):Colors.black,
                            size: 18,
                          ),
                          onPressed: () {
                            if(AppCubit.get(context).isMealInFavourites(restaurant)){
                              AppCubit.get(context).deleteMealFromDatabaseFavourite(restaurant);
                            }
                            else{
                              AppCubit.get(context).addMealToFavourite(restaurant);
                            }
                          },
                          padding: EdgeInsets.zero,
                        ),
                        height: 15,
                        width: 15,
                        // alignment: Alignment.center,
                      ),
                    ],
                  ),
                  height: 27,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
