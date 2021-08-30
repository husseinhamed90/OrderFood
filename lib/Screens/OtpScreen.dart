import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:orderfood/Screens/HomePage.dart';
import 'package:orderfood/Widgets/CustomBackButton.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {

  String phoneNumber="";
  String username="";
  String password="";
  String name="";

  OtpScreen(this.phoneNumber,this.name,this.password,this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit,CubitState>(
        listener: (context, state) {
          if(state is ValidUserState){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage(),));
          }
          else if(state is WrongOTPCode){
            final snackBar = SnackBar(content: Text('Invalid OTP Code'),backgroundColor: Colors.orange,);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          AppCubit appCubit =AppCubit.get(context);
          if(state is LoadingIndicator){
            return Scaffold(body: Container(child: Center(child: CircularProgressIndicator(
              color: Color(0xffF9881F),
            ))));
          }
          return  SafeArea(
            child: Container(
              color: Color(0xffF8FBFF),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBackButton(),
                  CustomSizedBox(38),
                  CustomHeader("Enter 6 digits verification code sent to your number $phoneNumber"),
                  CustomSizedBox(70),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width-100,
                      child: PinCodeTextField(
                        length: 6,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.black,
                          activeColor: Colors.orange,
                          selectedColor: Colors.orange,
                        ),
                        animationDuration: Duration(milliseconds: 100),
                        //backgroundColor: Colors.blue.shade50,
                        enableActiveFill: false,
                        //errorAnimationController: errorController,
                       //controller: textEditingController,
                        onCompleted: (otpCode) async{
                          UserAccount userAccount =UserAccount(username, password, name,phoneNumber);
                          await appCubit.checkOTPCode(otpCode, userAccount);
                        },
                        onChanged: (value) {
                          // print(value);
                        },
                        validator: (value) {

                        },
                        appContext: context,
                      ),
                    ),
                  ),
                  CustomButtom(buttonColor: Color(0xffF9881F), buttonFunction: ()async{

                    //verification here
                  }, textStyle: TextStyle(
                      fontSize: 15
                  ), buttonText: "Submit", width: MediaQuery.of(context).size.width-35),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
