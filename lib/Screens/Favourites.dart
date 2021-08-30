import 'package:flutter/material.dart';
import '../Widgets/BuildFavouritePage.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';

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
