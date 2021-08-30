import 'package:flutter/material.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/SignUp.dart';
import 'package:orderfood/Widgets/SizedBox.dart';

Widget googleButton(){
  return Container(
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        width: 204.w,
        height: 50.h,
        child: ElevatedButton.icon(
          icon: Image.asset(
            "images/google.png",
            height: 24.h,
            width: 24.w,
          ),
          label: Text(
            "Sign-in with Google",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.r)),
                      side: BorderSide(color: Colors.white)))),
          onPressed: () {},
        ),
      ),
    ),
  );
}

Widget bottomButtons(String buttonname,BuildContext context,TextEditingController username,TextEditingController password){
  return Center(
    child: Column(
      children: [
        googleButton(),
        CustomSizedBox(20),
        CustomButtom(
          width: double.infinity,
          buttonColor: Color(0xffF9881F),
          buttonFunction: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
          },
          buttonText: "Create an account",
          textStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        CustomSizedBox(20),
        CustomButtom(
          width: double.infinity,
          buttonColor: Color(0xffF8FBFF),
          buttonFunction: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => LoginPage(),
            //     ));
            print(username.text);
            print(password.text);
          },
          buttonText: buttonname,
          textStyle: TextStyle(
              fontSize: 16.sp,
              color: Color(0xffFE554A),
              fontWeight: FontWeight.w700),
        ),
        // Container(
        //   margin: EdgeInsets.only(bottom: 26.h),
        //   width: 335.w,
        //   height: 125.h,
        //   child: Column(
        //     children: [
        //
        //       // CustomButtom(
        //       //   width: double.infinity,
        //       //   buttoncolor: Color(0xffF9881F),
        //       //   buttonFunction: () {
        //       //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
        //       //   },
        //       //   Buttontext: "Create an account",
        //       //   textStyle: TextStyle(
        //       //       fontSize: 14.sp,
        //       //       color: Colors.white,
        //       //       fontWeight: FontWeight.w700),
        //       // ),
        //       // CustomSizedBox(20),
        //       // CustomButtom(
        //       //   width: double.infinity,
        //       //   buttoncolor: Color(0xffF8FBFF),
        //       //   buttonFunction: () {
        //       //     // Navigator.push(
        //       //     //     context,
        //       //     //     MaterialPageRoute(
        //       //     //       builder: (context) => LoginPage(),
        //       //     //     ));
        //       //     print(username.text);
        //       //     print(password.text);
        //       //   },
        //       //   Buttontext: buttonname,
        //       //   textStyle: TextStyle(
        //       //       fontSize: 16.sp,
        //       //       color: Color(0xffFE554A),
        //       //       fontWeight: FontWeight.w700),
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );

}
// class _BottomButtonsState extends State<BottomButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Container(
//             child: Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20.r)),
//                 ),
//                 width: 204.w,
//                 height: 50.h,
//                 child: ElevatedButton.icon(
//                   icon: Image.asset(
//                     "images/google.png",
//                     height: 24.h,
//                     width: 24.w,
//                   ),
//                   label: Text(
//                     "Sign-in with Google",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                       shape:
//                       MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(20.r)),
//                               side: BorderSide(color: Colors.white)))),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//           ),
//           CustomSizedBox(20),
//           Container(
//             margin: EdgeInsets.only(bottom: 26.h),
//             width: 335.w,
//             height: 125.h,
//             child: Column(
//               children: [
//
//                 CustomButtom(
//                   width: double.infinity,
//                   buttoncolor: Color(0xffF9881F),
//                   buttonFunction: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
//                   },
//                   Buttontext: "Create an account",
//                   textStyle: TextStyle(
//                       fontSize: 14.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 CustomSizedBox(20),
//                 CustomButtom(
//                   width: double.infinity,
//                   buttoncolor: Color(0xffF8FBFF),
//                   buttonFunction: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginPage(),
//                         ));
//                   },
//                   Buttontext: widget.buttonname,
//                   textStyle: TextStyle(
//                       fontSize: 16.sp,
//                       color: Color(0xffFE554A),
//                       fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
