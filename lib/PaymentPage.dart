import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/PaymentData.dart';
import 'package:orderfood/PaymentProcessEnd.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/ChangeData.dart';
import 'package:orderfood/Widgets/CustomBackButton.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<String>paymentmethods =["images/add.png","images/master.png","images/paypal.png"];
  String currentvalue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChangeData("Delivery Fee", Colors.black, "\$20"),
          ChangeData("Subtotal", Colors.black, "\$530"),
          Divider(height: 0.3,color: Colors.black,),
          ChangeData("Total", Colors.black, "\$550"),
          CustomSizedBox(20),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: CustomButtom(
              width: double.infinity,
              buttoncolor: Color(0xffF9881F),
              buttonFunction: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentProcessEnd(),));
              },
              Buttontext: "Proceed to Payment",
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
              ChangeData("137 Teaticket Hwy, East Falmouth MA 2536 137 Teaticket Hwy, East Falmouth MA 2536",Color(0xffFE554A),"change"),
              CustomSizedBox(15),
              ChangeData("+234 9011039271",Color(0xffFE554A),"change"),
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
                leading: Radio(
                  value: "Pay on arrival",
                  onChanged:(String ?value) {
                    setState(() {
                      currentvalue=value!;
                    });
                  },
                  groupValue: currentvalue,
                )

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
}
