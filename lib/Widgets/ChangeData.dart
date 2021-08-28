import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class ChangeData extends StatelessWidget {


  String data;
  Color color;
  String righttext;
  Function? onPressed;
  bool haveChangeButton=false;
  ChangeData(this.data,this.color,this.righttext,this.haveChangeButton,{this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20,right:20),
      child: Row(
        children: [
          Expanded(
            child: Text(data,style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w700
            )),
            flex: 4,
          ),
          (haveChangeButton)?Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => onPressed,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: AutoSizeText(righttext,style: TextStyle(
                    color: color,fontSize: 18,fontWeight: FontWeight.w700
                ),),
              ),
            ),
          ):Container()
        ],
      ),
    );
  }
}