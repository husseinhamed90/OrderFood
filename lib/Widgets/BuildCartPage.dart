import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/PaymentPage.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class BuildCartPage extends StatelessWidget {
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
        bottomSheet:  (AppCubit.get(context).account!.mapOfCartMeals.length>0)?Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width-100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text("Total",style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold
                ),),
                  Text("${AppCubit.get(context).total.toString()} \$",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                  ),),
              ],),
            ),
            SizedBox(height: 25,),
            Container(
              height: 70,
              padding: EdgeInsets.all(8.0),
              child: CustomButtom(
                width: double.infinity,
                buttoncolor: Color(0xffF9881F),
                buttonFunction: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(),));
                },
                Buttontext:("Process to payment"),
                textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ):SizedBox(height: 0,),
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
                    (AppCubit.get(context).account!.mapOfCartMeals.length>0) ?CustomSizedBox(38):Container(),
                    (AppCubit.get(context).account!.mapOfCartMeals.length>0) ?CustomHeader("Your Cart"):Container(),
                    (AppCubit.get(context).account!.mapOfCartMeals.length>0) ?Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => CustomSizedBox(20),
                        itemBuilder: (context, index) =>  Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: BuildItem(AppCubit.get(context).account!.mapOfCartMeals.values.elementAt(index)),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {
                                AppCubit.get(context).deleteMealFromDatabaseCart(AppCubit.get(context).account!.mapOfCartMeals.values.elementAt(index));
                              },
                            ),
                          ],
                        ),
                        itemCount: AppCubit.get(context).account!.mapOfCartMeals.length,
                      ),
                    ) : Expanded(child: Image.network("https://freepikpsd.com/media/2019/10/empty-cart-png-Transparent-Images.png",width: MediaQuery.of(context).size.width-20,))
                  ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
