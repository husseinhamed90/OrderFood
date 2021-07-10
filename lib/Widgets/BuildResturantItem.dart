import 'package:flutter/material.dart';
import 'package:orderfood/Mealdetails.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class BuildRestirantItem extends StatefulWidget {
  Restaurant restaurant;
  BuildRestirantItem(this.restaurant);
  @override
  _BuildRestirantItemState createState() => _BuildRestirantItemState();
}

class _BuildRestirantItemState extends State<BuildRestirantItem> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetails(),));
      },
      child: Container(
        padding:
        EdgeInsets.only(top: 15, right: 15, left: 15),
        height: 260,
        width: 200,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Container(
              height: 112,
              width: 170,
              child: Image.network("${widget.restaurant.path}"),
              //child: Image.asset("images/burger.png"),
            ),
            CustomSizedBox(20),
            Container(
              alignment: Alignment.centerLeft,
              height: 21,
              child: Text(
                "${widget.restaurant.restaurantname}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3D3D3D),
                ),
              ),
            ),
            CustomSizedBox(5),
            Container(
                alignment: Alignment.centerLeft,
                height: 36,
                child: Text(
                  "${widget.restaurant.address}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3D3D3D),
                      fontWeight: FontWeight.w400),
                )),
            CustomSizedBox(12),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    child: IconButton(
                      icon: Icon(
                        Icons.star,
                        color: Color(0xffF5A62E),
                        size: 18,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                    height: 18,
                    width: 18,

                    // alignment: Alignment.center,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    child: Text(
                      "4+",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    height: 18,
                    width: 18,
                  ),
                  Spacer(),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Color(0xffFE554A),
                        size: 18,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                    height: 15,
                    width: 15,
                    // alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
