// import 'package:flutter/material.dart';
// import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
// import 'package:orderfood/Models/UserAccount.dart';
// import 'package:orderfood/Widgets/CustomButton.dart';
// import 'package:orderfood/Widgets/CustomHeader.dart';
// import 'package:orderfood/Widgets/CustomTextForm.dart';
// import 'package:orderfood/Widgets/SizedBox.dart';
// class BuildProfileData extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xffF8FBFF),
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: SingleChildScrollView(
//         child: Column(
//
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomSizedBox(50),
//             CustomHeader("Update Profile"),
//             CustomSizedBox(14),
//             CustomTextForm("User Name",MediaQuery.of(context).size.width-40,name),
//             CustomSizedBox(20),
//             CustomTextForm("Email Address",MediaQuery.of(context).size.width-40,username),
//             CustomSizedBox(20),
//             CustomTextForm("Password",MediaQuery.of(context).size.width-40,password),
//             CustomSizedBox(20),
//             CustomTextForm("Confirm Password",MediaQuery.of(context).size.width-40,confirmpassword),
//
//             CustomSizedBox(74),
//             Center(
//               child: CustomButtom(
//                 width: MediaQuery.of(context).size.width-70,
//                 buttoncolor: Color(0xffF9881F),
//                 buttonFunction: () {
//                   UserAccount updateduseraccount =UserAccount(username.text, password.text, name.text, AppCubit.get(context).account!.id);
//                   AppCubit.get(context).UpdateProfileInfo(updateduseraccount);
//                   //appCubit.register(username.text,password.text,confirmpassword.text,name.text);
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
//                 },
//                 Buttontext: "Update Profile",
//                 textStyle: TextStyle(
//                     fontSize: 14.sp,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//             CustomSizedBox(20),
//           ],
//         ),
//       ),
//     );
//   }
// }
