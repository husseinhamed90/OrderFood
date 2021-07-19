import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Meal.dart';
import 'Cart.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';

import '../Widgets/SizedBox.dart';
class MealDetails extends StatefulWidget {
  Meal meal;
  MealDetails(this.meal);
  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {
        if(state is MealAddedToAccount){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if(state is AddMealToCartLoadingState){
          return Scaffold(
            body: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return  Scaffold(
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
          bottomNavigationBar:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButtom(
              width: double.infinity,
              buttoncolor: Color(0xffF9881F),
              buttonFunction: () {
                AppCubit.get(context).AddMealToCart(widget.meal);
              },
              Buttontext: "Add to cart",
              textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: Container(
            color: Color(0xffF8FBFF),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomSizedBox(40),
                  Container(

                    margin: EdgeInsets.only(right: 60,left: 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 150,
                      child: Image.network(widget.meal.path),
                      //child: Image.asset("images/burger.png"),
                    ),
                  ),
                  CustomSizedBox(35),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF9881F),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 51,
                      width: 100,
                      alignment: Alignment.center,
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              child: FittedBox(
                                child: Text("+",style: TextStyle(
                                    fontSize:20,fontWeight:FontWeight.w700,color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text(counter.toString(),style: TextStyle(
                                  fontSize:20,fontWeight:FontWeight.w700,color: Colors.white
                              ),),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if(counter>0)
                                    counter--;
                                });
                              },
                              child: FittedBox(
                                child: Text("-",style: TextStyle(
                                    fontSize:20,fontWeight:FontWeight.w700,color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(15),
                    ),
                  ),
                  CustomSizedBox(35),
                  Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    child: Text(widget.meal.mealname,style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.w700
                    ),),
                  ),
                  CustomSizedBox(63),
                  Container(
                      margin: EdgeInsets.only(right: 35,left: 36),
                      child: AutoSizeText(widget.meal.description,style: TextStyle(
                          fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
                      ),)),
                ],
              ),
            ),

          ),
        );
      },
    );
  }
}
