import 'package:flutter/material.dart';
import 'PaymentPage.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width-100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total"),
              //  Spacer(),
                Text("\$ 335",style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xff3D3D3D)
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButtom(
              width: double.infinity,
              buttonColor: Color(0xffF9881F),
              buttonFunction: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(),));
              },
              buttonText: "Process to payment",
              textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      body: BuildCartPage()
      //appBar: AppBar(),
    );
  }
}
