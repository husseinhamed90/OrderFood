import 'package:flutter/material.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
// ignore: must_be_immutable
class CustomTextForm extends StatefulWidget {
  String label;
  double width;
  bool obscureText=true;
  bool haveObscureText=false;
  TextEditingController controller;
  CustomTextForm(this.label,this.width,this.controller,[this.haveObscureText=false]);

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Container(
        color: Color(0xffF8FBFF),
        //height: 76.h,
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 23),
              child: Text(widget.label,style: TextStyle(
                  fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
              ),),
            ),
            CustomSizedBox(10),
            Container(
              //height: 50.h,
              child: TextFormField(
                controller: widget.controller,
                obscureText: (widget.haveObscureText)?widget.obscureText:false,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.blue)),
                  filled: true,
                  suffixIcon: (widget.haveObscureText)?InkWell(child: Icon((!widget.obscureText)?Icons.visibility:Icons.visibility_off),onTap: () {
                    setState(() {
                      widget.obscureText=!widget.obscureText;
                    });
                  },):null,
                  contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Widget CustomTextForm(String label,double widht,TextEditingController controller,[bool obscureText=false]){
//   return  Center(
//     child: Container(
//       color: Color(0xffF8FBFF),
//       //height: 76.h,
//       width: widht,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 23),
//             child: Text(label,style: TextStyle(
//                 fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)
//             ),),
//           ),
//           CustomSizedBox(10),
//           Container(
//             //height: 50.h,
//             child: TextFormField(
//               controller: controller,
//               obscureText: obscureText,
//               decoration: InputDecoration(
//                 border: new OutlineInputBorder(
//                     borderSide: new BorderSide(color: Colors.teal),borderRadius: BorderRadius.circular(15)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                     borderSide: BorderSide(color: Colors.blue)),
//                 filled: true,
//                 suffixIcon: InkWell(child: Icon((!obscureText)?Icons.visibility:Icons.visibility_off),onTap: () {
//                   obscureText=!obscureText;
//                 },),
//                 contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
//
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
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