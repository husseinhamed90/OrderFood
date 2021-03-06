import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Widgets/Description.dart';
import 'HomePage.dart';
import 'package:orderfood/Widgets/BottomButtons.dart';
import 'package:orderfood/Widgets/CustomAppBar.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/CustomTextForm.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

// ignore: must_be_immutable
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
               final snackBar = SnackBar(content: Text('Invalid Data'),backgroundColor: Color(0xffF9881F),);
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
             }
             else if(state is DataIsInLoadingPhase){
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
               return Container(child: Center(child: CircularProgressIndicator(
                 color: Color(0xffF9881F),
               )));
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
                    googleButton(),
                    CustomSizedBox(20),
                    CustomButtom(
                      width: double.infinity,
                      buttonColor: Color(0xffF8FBFF),
                      buttonFunction: () async{
                        appCubit.login(username.text, password.text);
                      },
                      buttonText: "Login to my account",
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
