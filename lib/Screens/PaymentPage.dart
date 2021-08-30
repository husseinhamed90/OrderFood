import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'PaymentData.dart';
import 'PaymentProcessEnd.dart';
import 'package:orderfood/Widgets/ChangeData.dart';
import 'package:orderfood/Widgets/CustomBackButton.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
// ignore: must_be_immutable
class PaymentPage extends StatelessWidget {
  List<String>paymentmethods =["images/add.png","images/master.png","images/paypal.png"];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
        listener: (context, state) {

        },
        builder: (context, state){
          if(state is UpdateUserAccountInProgress){
            return Scaffold(
              body: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return Scaffold(
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChangeData("Delivery Fee", Colors.black, "\$20",true),
                ChangeData("Subtotal", Colors.black, "\$${AppCubit.get(context).total}",true),
                Divider(height: 0.3,color: Colors.black,),
                ChangeData("Total", Colors.black, "\$${AppCubit.get(context).total+20}",true),
                CustomSizedBox(20),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  child: CustomButtom(
                    width: double.infinity,
                    buttonColor: Color(0xffF9881F),
                    buttonFunction: () async{
                      if(AppCubit.get(context).account!.mapOfCartMeals.length>0){
                        await AppCubit.get(context).makeOrder();
                        await AppCubit.get(context).resetCubitData();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentProcessEnd(),));
                      }
                    },
                    buttonText: "Proceed to Payment",
                    textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSizedBox(30),
                    CustomBackButton(),
                    CustomSizedBox(50),
                    CustomHeader("Delivery method"),
                    CustomSizedBox(30),
                    ChangeData(AppCubit.get(context).location,Color(0xffFE554A),"change",true),
                    CustomSizedBox(15),
                    ChangeData(AppCubit.get(context).account!.phoneNumber,Color(0xffFE554A),"change",false),
                    CustomSizedBox(30),
                    CustomHeader("Payment"),
                    Container(
                      padding: EdgeInsets.only(left: 24),
                      height: 70,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: 25,),
                        itemBuilder: (context, index) =>  InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentData(),));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 50,width: 50,child: Image.asset(paymentmethods[index]),
                          ),
                        ),
                        itemCount: paymentmethods.length,
                      ),
                    ),
                    ListTile(
                        title: const Text('Pay on arrival',style: TextStyle(
                            fontSize: 15,fontWeight: FontWeight.bold
                        ),),
                        leading: InkWell(
                          child: Radio(
                            value: "Pay on arrival",
                            onChanged:(String ?value) {
                              AppCubit.get(context).changeValueOfPayOnArrival(value!);
                            },
                            groupValue: AppCubit.get(context).payOnArrival,
                          ),
                        ),
                      onTap: () {
                          if(AppCubit.get(context).payOnArrival==""){
                            AppCubit.get(context).changeValueOfPayOnArrival("Pay on arrival");

                          }
                          else{
                            AppCubit.get(context).changeValueOfPayOnArrival("");

                          }
                      },

                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24),
                      alignment: Alignment.centerLeft,
                      child: Text("Pay with cash/POS upon arrival ",style: TextStyle(
                          fontSize: 14,color: Color(0xffFE554A)
                      ),),
                    ),
                  ],
                ),
              ),

            ),
          );
        }
    );
  }
}