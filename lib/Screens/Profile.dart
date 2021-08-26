// import 'package:flutter/material.dart';
// import 'package:orderfood/Widgets/BottomButtons.dart';
// import 'package:orderfood/Widgets/CustomAppBar.dart';
// import 'package:orderfood/Widgets/CustomHeader.dart';
// import 'package:orderfood/Widgets/CustomTextForm.dart';
// import 'package:orderfood/Widgets/Description.dart';
// import 'package:orderfood/Widgets/SizedBox.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'CustomButton.dart';
// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//           child: CustomAppBar(() {}, "Skip"),
//           preferredSize: Size.fromHeight(50.h),
//         ),
//         body: Container(
//           color: Color(0xffF8FBFF),
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomSizedBox(50),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 44),
//                   width: double.infinity,
//                   child: Text(
//                     "Create an account",
//                     style: TextStyle(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xff1C1C1C)),
//                   ),
//                 ),
//               ),
//               //Container(color: Colors.red,child: Expanded(flex: 2,child: CustomHeader("Create an account"))),
//               CustomSizedBox(14),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 44),
//                   child: Text("Welcome friend, enter your details so lets get started in ordering food.",
//                     style: TextStyle(
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff3D3D3D)),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding:  EdgeInsets.only(left: 44),
//                   child: Text("Email Address",style: TextStyle(
//                       fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
//                   ),),
//                 ),
//               ),
//               CustomSizedBox(10),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding:  EdgeInsets.only(left: 44,right: 44),
//                   child: TextFormField(
//
//                     decoration: InputDecoration(
//                       border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(15.r)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(15.r)),
//                           borderSide: BorderSide(color: Colors.blue)),
//                       filled: true,
//                       //contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
//
//                     ),
//                   ),
//                 ),
//               ),
//               CustomSizedBox(10),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding:  EdgeInsets.only(left: 44),
//                   child: Text("Password",style: TextStyle(
//                       fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
//                   ),),
//                 ),
//               ),
//               CustomSizedBox(20),
//               Expanded(
//                 flex: 8,
//                 child: Container(
//                   padding:  EdgeInsets.only(left: 44,right: 44),
//                   child: TextFormField(
//
//                     decoration: InputDecoration(
//                       border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(15.r)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(15.r)),
//                           borderSide: BorderSide(color: Colors.blue)),
//                       filled: true,
//                       //contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
//
//                     ),
//                   ),
//                 ),
//               ),
//              // Container(color: Colors.red,child: Expanded(flex: 1,child: Description("Welcome friend, enter your details so lets get started in ordering food."))),
//               // CustomSizedBox(54),
//               // CustomTextForm("Email Address"),
//               // CustomSizedBox(20),
//               // CustomTextForm("Password"),
//               // CustomSizedBox(20),
//               // CustomTextForm("Confirm Password"),
//               // //Spacer(),
//               CustomSizedBox(74),
//               // Expanded(flex: 8,child:  CustomButtom(
//               //   buttoncolor: Color(0xffF9881F),
//               //   buttonFunction: () {
//               //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
//               //   },
//               //   Buttontext: "Create an account",
//               //   textStyle: TextStyle(
//               //       fontSize: 14.sp,
//               //       color: Colors.white,
//               //       fontWeight: FontWeight.w700),
//               // ),)
//             ],
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'HomePage.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:orderfood/Widgets/BottomButtons.dart';
import 'package:orderfood/Widgets/CustomAppBar.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:orderfood/Widgets/CustomHeader.dart';
import 'package:orderfood/Widgets/CustomTextForm.dart';
import '../Widgets/Description.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Profile extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Profile> {

  TextEditingController username =new TextEditingController();
  TextEditingController password =new TextEditingController();
  TextEditingController name =new TextEditingController();
  TextEditingController confirmpassword =new TextEditingController();


  @override
  Widget build(BuildContext context) {
    username.text=AppCubit.get(context).account!.username;
    password.text=AppCubit.get(context).account!.Password;
    name.text=AppCubit.get(context).account!.name;
    confirmpassword.text=AppCubit.get(context).account!.Password;

    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state){
        if(state is ValidUserState){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
        else if(state is InvalidRegisteration || state is InvalidUserState){
          final snackBar = SnackBar(content: Text('Invalid Data'),backgroundColor: Colors.orange,);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        else if(state is EmptyFeildsFound){
          final snackBar = SnackBar(content: Text('Some Input Fields Found'),backgroundColor: Colors.orange,);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        // else if(state is AccountisUpdated){
        //
        // }
      },
      builder: (context, state) {
        AppCubit appCubit =AppCubit.get(context);
        if(state is LoadingIndicator){
          return Scaffold(body: Container(child: Center(child: CircularProgressIndicator())));
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
                CustomHeader("Update Profile"),
                CustomSizedBox(14),
                CustomTextForm("User Name",MediaQuery.of(context).size.width-40,name),
                CustomSizedBox(20),
                CustomTextForm("Email Address",MediaQuery.of(context).size.width-40,username),
                CustomSizedBox(20),
                CustomTextForm("Password",MediaQuery.of(context).size.width-40,password),
                CustomSizedBox(20),
                CustomTextForm("Confirm Password",MediaQuery.of(context).size.width-40,confirmpassword),

                CustomSizedBox(74),
                Center(
                  child: CustomButtom(
                    width: MediaQuery.of(context).size.width-70,
                    buttoncolor: Color(0xffF9881F),
                    buttonFunction: () {
                      UserAccount updateduseraccount =UserAccount(username.text, password.text, name.text, AppCubit.get(context).account!.id);
                      appCubit.UpdateProfileInfo(updateduseraccount);
                      //appCubit.register(username.text,password.text,confirmpassword.text,name.text);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    },
                    Buttontext: "Update Profile",
                    textStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                CustomSizedBox(20),
              ],
            ),
          ),
        );
            // appBar: PreferredSize(
            //   child: CustomAppBar(() {}, "Skip"),
            //   preferredSize: Size.fromHeight(50),
            // ),
            //body:
      },
    );
  }
}
