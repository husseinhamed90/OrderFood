import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
// ignore: must_be_immutable
class CustomAppBar2 extends StatefulWidget {
  Widget leading;
  CustomAppBar2(this.leading);
  @override
  _CustomAppBar2State createState() => _CustomAppBar2State();
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {},
      builder: (context, state) => AppBar(
          elevation: 0,
          centerTitle: true,
          title: Container(
            alignment: Alignment.center,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "Delivery to",
                        style: TextStyle(
                            color: Color(0xff1C1C1C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black,
                    )
                  ],
                ),
                CustomSizedBox(1),
                Container(
                  alignment: Alignment.center,
                  //height: 23.h,
                  // width: 133.w,
                  child: AutoSizeText(
                    AppCubit.get(context).location,
                    style: TextStyle(
                        color: Color(0xfffe554a),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Color(0xffF8FBFF),
          actions: [
            Container(
              height: 50,
              width: 45,
              margin: EdgeInsets.only(right: 15,top: 7),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(80))
              ),
              child: ClipOval(child: Image.network("https://images.unsplash.com/photo-1586083702768-190ae093d34d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWFufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",fit: BoxFit.fitWidth,)),
            ),
          ],
          leading:widget.leading

      ),
    );
  }
}
