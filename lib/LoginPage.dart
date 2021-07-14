import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Description.dart';
import 'package:orderfood/HomePage.dart';
import 'package:orderfood/Services.dart';
import 'package:orderfood/SignUp.dart';
import 'package:orderfood/Widgets/BottomButtons.dart';
import 'package:orderfood/Widgets/CustomAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/CustomTextForm.dart';
//import 'Screens/Description.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

class LoginPage extends StatelessWidget {
  TextEditingController username =new TextEditingController();
  TextEditingController password =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar(() {}, "Skip"),
          preferredSize: Size.fromHeight(50),
        ),
        body: BlocConsumer<AppCubit,CubitState>(
           listener: (context, state) {
             if(state is ValidUserState){
               Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => HomePage(),
                   ));
             }
             else if(state is InvalidUserState){
               final snackBar = SnackBar(content: Text('Invalid Data'));
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
             }
             else if(state is DataisInLoaded){
               Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => HomePage(),
                   ));
             }
           },
          builder: (context, state) {
             AppCubit appCubit =AppCubit.get(context);
             if(state is LoadingIndicator){
               print("ddwwefewfew");
               return Container(child: Center(child: CircularProgressIndicator()));
             }
            return  Container(
              color: Color(0xffF8FBFF),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizedBox(50),
                    CustomHeader("Login to your account"),
                    CustomSizedBox(14),
                    Description("Good to see you again, enter your details below to continue ordering"),
                    CustomSizedBox(54),
                    CustomTextForm("Email Address",MediaQuery.of(context).size.width-40,username),
                    CustomSizedBox(20),
                    CustomTextForm("Password",MediaQuery.of(context).size.width-40,password),
                    CustomSizedBox(74),
                    GoogleButton(),
                    CustomSizedBox(20),
                    Center(
                      child: CustomButtom(
                        width: MediaQuery.of(context).size.width-70,
                        buttoncolor: Color(0xffF9881F),
                        buttonFunction: () {
                          appCubit.LoadData();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        },
                        Buttontext: "Create an account",
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    CustomSizedBox(20),
                    CustomButtom(
                      width: double.infinity,
                      buttoncolor: Color(0xffF8FBFF),
                      buttonFunction: () async{
                        appCubit.Login(username.text, password.text);
                      },
                      Buttontext: "Login to my account",
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xffFE554A),
                          fontWeight: FontWeight.w700),
                    )
                    //BottomButtons("Login to my account",context)
                  ],
                ),
              ),
            );
          },
        ));
  }
}
