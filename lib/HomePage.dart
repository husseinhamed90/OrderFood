import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Widgets/BuildCategoryItem.dart';
import 'package:orderfood/Widgets/BuildResturantItem.dart';
import 'package:orderfood/Widgets/CustomAppBar2.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'Mealdetails.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentindex=0;


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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favourite"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded),label: "Profile")
            ],
            onTap: (value) {
              // setState(() {
              //   currentindex=value;
              // });
            },
            selectedItemColor: Color(0xffF9881F),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async=> await AppCubit.get(context).GetAllResturants(),

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
                                Expanded(flex: 1,child: Text("Marvis Ighedosa")),
                                Expanded(flex: 1,child: Text("dosamarvis@gmail.com"))

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
                        buttonFunction: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
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
          ),
          body: Container(
            color: Color(0xffF8FBFF),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(50),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 31,
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Enjoy Delicious food",
                      style: TextStyle(
                          color: Color(0xff3D3D3D),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  CustomSizedBox(50),
                  Container(
                    height: 110,
                    padding: EdgeInsets.only(left: 24),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return BuildCategoryItem(appCubit.categories[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 22,
                        );
                      },
                      itemCount: appCubit.categories.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  CustomSizedBox(50),
                  Container(
                    padding: EdgeInsets.only(left: 24, right: 10),
                    //height: 321.h,
                    child: Column(
                      children: [
                        Container(
                          height: 21,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                "Popular restaurants",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              Text(
                                "View all(29)",
                                style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xffFF774C)),
                              )
                            ],
                          ),
                        ),
                        CustomSizedBox(50),
                        Container(
                          width: double.infinity,
                          height: 260,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return BuildRestirantItem(appCubit.resturants[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 22,
                              );
                            },
                            itemCount: appCubit.resturants.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                    //color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


