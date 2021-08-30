import 'package:flutter/material.dart';
import 'PaymentProcessEnd.dart';
import 'package:orderfood/Widgets/CustomBackButton.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class PaymentData extends StatefulWidget {
  @override
  _PaymmentDataState createState() => _PaymmentDataState();
}

class _PaymmentDataState extends State<PaymentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
            child: CustomButtom(
              width: double.infinity,
              buttonColor: Color(0xffF9881F),
              buttonFunction: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentProcessEnd(),));
              },
              buttonText: "Pay now",
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
              CustomHeader("Payment"),
              CustomSizedBox(30),
              //CustomTextForm("Card details",MediaQuery.of(context).size.width-40),
              CustomSizedBox(30),
              Container(
                width: MediaQuery.of(context).size.width-40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  // Expanded(child: CustomTextForm("Exp date",(MediaQuery.of(context).size.width-40)/2)),
                    SizedBox(width: 20,),
                  //  Expanded(child: CustomTextForm("CVV",(MediaQuery.of(context).size.width-40)/2)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
