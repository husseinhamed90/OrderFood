import 'package:flutter/material.dart';
import 'package:orderfood/Models/Category.dart';

class BuildCategoryItem extends StatefulWidget {
  Category category;
  BuildCategoryItem(this.category);
  @override
  _BuildCatagoryItemState createState() => _BuildCatagoryItemState();
}

class _BuildCatagoryItemState extends State<BuildCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 109,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                //color: Color(0xff3EC032),
                color: Color(0xffF9881F),
                width: 1,
              )),
          //   height: double.infinity-0,
          width: 82,
        ),
        Container(
          //  padding: EdgeInsets.only(top: 10,bottom: 20),
          decoration: BoxDecoration(
              color: Color(0xffA9E88B).withOpacity(0.2),
              borderRadius: BorderRadius.circular(45)),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 7,
              ),
              //CustomSizedBox(22),
              Expanded(
                child: Container(
                  child: Image.network("${widget.category.path}",height: 24,width: 24,),
                  //  height: 50,
                ),
                flex: 5,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                      "${widget.category.name}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // CustomSizedBox(10),
            ],
          ),
          // alignment: Alignment.center,
          height: 87,
          width: 65,
          margin: EdgeInsets.all(8),
          // height: double.infinity-25,
          // width: 65,
        ),
      ],
    );
  }
}
