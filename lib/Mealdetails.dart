import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'Cart.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';

import '../Widgets/SizedBox.dart';
class MealDetails extends StatefulWidget {
  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int counter =0;
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
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButtom(
          width: double.infinity,
          buttoncolor: Color(0xffF9881F),
          buttonFunction: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
            //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
          },
          Buttontext: "Add to cart",
          textStyle: TextStyle(
              fontSize: 14.sp,
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
                  child: Image.network("https://www.freepngimg.com/thumb/burger/2-2-burger-free-download-png.png"),
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
                child: Text("Big Cheese burger",style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.w700
                ),),
              ),
              CustomSizedBox(63),
              Container(
                margin: EdgeInsets.only(right: 35,left: 36),
                  child: Text("Our simple, classic cheeseburger begins with a 100% pure beef burger seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped",style: TextStyle(
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
                  ),)),
            ],
          ),
        ),

      ),
    );
  }
}
