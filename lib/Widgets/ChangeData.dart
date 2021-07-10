import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class ChangeData extends StatefulWidget {


  String data;
  Color color;
  String righttext;
  ChangeData(this.data,this.color,this.righttext);
  @override
  _ChangeDataState createState() => _ChangeDataState();
}

class _ChangeDataState extends State<ChangeData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20,right:20),
      child: Row(
        children: [
          Expanded(
            child: Text(widget.data,style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.w700
            )),
            flex: 4,
          ),
          // Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: AutoSizeText(widget.righttext,style: TextStyle(
                  color: widget.color,fontSize: 18,fontWeight: FontWeight.w700
              ),),
            ),
          )
        ],
      ),
    );
  }
}
