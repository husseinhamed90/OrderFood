import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import '../Screens/PaymentPage.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class CategoryMealsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {

      },
      builder: (context, state) =>  Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(
              Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.only(left: 21),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              )),
          preferredSize: Size.fromHeight(50),
        ),
        body:  BlocConsumer<AppCubit,CubitState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return SafeArea(
                child: Container(
                  color: Color(0xffF8FBFF),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSizedBox(38),
                      CustomHeader(AppCubit.get(context).categories[AppCubit.get(context).currentcategoryposition].name!),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => CustomSizedBox(20),
                          itemBuilder: (context, index) => BuildItem(getCorrectMeal(context, index)),
                          itemCount: AppCubit.get(context).PopularMeals.length,
                        ),
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
  Meal getCorrectMeal(BuildContext context, int index) {
    if (AppCubit.get(context).isMealInCart(AppCubit.get(context).PopularMeals[index])) {
      return AppCubit.get(context).account!.mapOfCartMeals[AppCubit.get(context).PopularMeals[index].mealID]!;
    }
    else {
      return AppCubit.get(context).PopularMeals[index];
    }
  }
}
