import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/LoginPage.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        AppCubit appCubit =AppCubit.get(context);
        return Scaffold(
           key: _scaffoldKey,
          appBar: PreferredSize(
            child: CustomAppBar2(
                Container(
                  height: 40.h,
                  width: 40.w,
                  padding: EdgeInsets.only(left: 21),
                  child: IconButton(
                    onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.sort,
                      color: Colors.black,
                    ),
                  ),
                )),
            preferredSize: Size.fromHeight(50),
          ),
          bottomNavigationBar: Container(
            height: 90,

            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(

                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: appCubit.currentindex,
                    items: [
                      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                      BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favourite"),
                      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
                      BottomNavigationBarItem(icon: Icon(Icons.person_rounded),label: "Profile"),
                    ],
                    onTap: (value) {
                      appCubit.changeposition(value);
                      if(appCubit.currentindex==2){
                        appCubit.calculateTotalPrice();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BuildCartPage()));
                        appCubit.changeposition(0);
                      }
                    },
                    selectedItemColor: Color(0xffF9881F),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: CircleAvatar(
                        child: Icon(Icons.search_outlined,color: Colors.white,),
                        backgroundColor: Color(0xffF9881F),
                        radius: 30,
                      ),
                    ))
              ],
            ),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: DrawerHeader(
                        child:Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Color(0xffF8FBFF),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 2,child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                              Expanded(flex: 6,child: Container(child: Image.asset("images/man.png"),height: 70,width: 70,)),
                              Expanded(flex: 1,child: Text(appCubit.account!.name)),
                              Expanded(flex: 1,child: Text(appCubit.account!.username))

                            ],
                          ),
                        )
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("My Profile"),
                          leading: Icon(Icons.person_rounded),
                          onTap: () {
                            appCubit.changeposition(3);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Payment method"),
                          leading: Icon(Icons.payment),
                        ),
                        ListTile(
                          title: Text("Settings"),
                          leading: Icon(Icons.settings),
                        ),
                        ListTile(
                          title: Text("Help"),
                          leading: Icon(Icons.help),
                        ),
                        ListTile(
                          title: Text("Privacy policy"),
                          leading: Icon(Icons.privacy_tip),
                        ),

                      ],
                    ),
                  ),
                  CustomSizedBox(20),
                  // Spacer(),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(20),
                    child: CustomButtom(
                      width: 120,
                      buttoncolor: Color(0xffF9881F),
                      buttonFunction: () async{
                        await FirebaseAuth.instance.signOut();
                        appCubit.changeposition(0);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      },
                      Buttontext: "Log out",
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                ],
              ),
            ),
          ),
          body: appCubit.currentpage
        );
      },
    );
  }
}


