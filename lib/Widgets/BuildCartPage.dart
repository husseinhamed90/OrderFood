import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Widgets/BuildItem.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
class BuildCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xffF8FBFF),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: (AppCubit.get(context).account!.Meals.length>0)?Column(
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
                  child: BuildItem(AppCubit.get(context).account!.Meals[index]),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      //  onTap: () => _showSnackBar('Delete'),
                    ),
                  ],
                ),
                itemCount: AppCubit.get(context).account!.Meals.length,
              ),
            )
          ],
        ):Container(),
      ),
    );
  }
}
