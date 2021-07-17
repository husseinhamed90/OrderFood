import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orderfood/BuildFavouritePage.dart';
import 'package:orderfood/PaymentPage.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

import '../Widgets/CustomBackButton.dart';
class Favourite extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Favourite> {
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
        body: BuildFavouritePage()
      //appBar: AppBar(),
    );
  }
}
