import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orderfood/PaymentPage.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

import '../Widgets/CustomBackButton.dart';
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
              buttoncolor: Color(0xffF9881F),
              buttonFunction: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(),));
              },
              Buttontext: "Process to payment",
              textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xffF8FBFF),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSizedBox(38),
              CustomHeader("Your Cart"),
              CustomSizedBox(38),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => CustomSizedBox(20),
                  itemBuilder: (context, index) =>  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: BuildItem(),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        //  onTap: () => _showSnackBar('Delete'),
                      ),
                    ],
                  ),
                  itemCount: 3,
                ),
              )
            ],
          ),
        ),
      ),
      //appBar: AppBar(),
    );
  }
}
