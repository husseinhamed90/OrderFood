import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class PaymentProcessEnd extends StatefulWidget {
  @override
  _PaymentProcessEndState createState() => _PaymentProcessEndState();
}

class _PaymentProcessEndState extends State<PaymentProcessEnd> {
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                },
                buttonText: "Go back to home",
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
                CustomSizedBox(130),
                Container(
                padding: EdgeInsets.symmetric(horizontal: 90)
                ,child: Image.asset("images/EndProcess.png",height: 120,)),
                CustomSizedBox(25),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text("Your order has been successfully placed",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 24,fontWeight: FontWeight.w700
                  ),),
                ),
                CustomSizedBox(20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: AutoSizeText("Sit and relax while your orders is being worked on . It’ll take 5min before you get it",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w400
                  ),),
                )
              ],
            ),
          ),
        )
    );
  }
}
