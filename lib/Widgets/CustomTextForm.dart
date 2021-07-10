import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
// class CustomTextForm extends StatefulWidget {
//   String label;
//   double widht;
//   CustomTextForm(this.label,this.widht);
//   @override
//   _CustomTextFormState createState() => _CustomTextFormState();
// }

Widget CustomTextForm(String label,double widht,TextEditingController controller){
  return  Center(
    child: Container(
      color: Color(0xffF8FBFF),
      //height: 76.h,
      width: widht,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(label,style: TextStyle(
                fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
            ),),
          ),
          CustomSizedBox(10),
          Container(
            //height: 50.h,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.blue)),
                filled: true,
                contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),

              ),
            ),
          )
        ],
      ),
    ),
  );
}
// class _CustomTextFormState extends State<CustomTextForm> {
//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       child: Container(
//         color: Color(0xffF8FBFF),
//         //height: 76.h,
//         width: widget.widht,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding:  EdgeInsets.only(left: 23),
//               child: Text(widget.label,style: TextStyle(
//                   fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
//               ),),
//             ),
//             CustomSizedBox(10),
//             Container(
//               //height: 50.h,
//               child: TextFormField(
//
//                 decoration: InputDecoration(
//                   border: new OutlineInputBorder(
//                       borderSide: new BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(15)),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(15)),
//                       borderSide: BorderSide(color: Colors.blue)),
//                   filled: true,
//                   contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
//
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }