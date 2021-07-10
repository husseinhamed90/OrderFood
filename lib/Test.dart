
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toInt());
    return (

        // builder: () => Scaffold(
        //     body: Row(
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: Column(
        //             children: [
        //               Expanded(
        //                 flex: 2,
        //                 child: Container(
        //                   width: double.infinity,
        //                   //width: 200,
        //                   color: Colors.red,
        //                 ),
        //
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: Container(
        //                   width: double.infinity,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: Container(
        //                   width: double.infinity,
        //                   //width: 200,
        //                   color: Colors.black,
        //                 ),
        //
        //               )
        //             ],
        //           ),
        //         ),
        //
        //         Expanded(
        //           flex: 1,
        //           child: Column(
        //             children: [
        //               Expanded(
        //                 flex: 2,
        //                 child: Container(
        //                   width: double.infinity,
        //                   //width: 200,
        //                   color: Colors.black,
        //                 ),
        //
        //               ),
        //               MediaQuery(
        //                 data: MediaQuery.of(context).copyWith(textScaleFactor: 2),
        //                 child: Expanded(
        //                   flex: 2,
        //                   child: Container(
        //                     width: double.infinity,
        //                     color: Colors.white,
        //                     child: Center(
        //                       child: Text("Hello Flutter Iam Here",maxLines: 1,style: TextStyle(
        //                           color: Colors.teal
        //                       ),),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: Container(
        //                   width: double.infinity,
        //                   //width: 200,
        //                   color: Colors.red,
        //                 ),
        //
        //               )
        //             ],
        //           ),
        //         ),
        //       ],
        //     )
        //
        // ),
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Container(
                  alignment: Alignment.center,
                  //height: 45.h,
                  //width: 133.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 21.h,
                            width: 64.w,
                            child: AutoSizeText(
                              "Delivery to",
                              style: TextStyle(
                                  color: Color(0xff1C1C1C),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                      CustomSizedBox(1),
                      Container(
                        alignment: Alignment.center,
                        //height: 23.h,
                        width: 133.h,
                        child: AutoSizeText(
                          "lekki phase 1, Estate",
                          style: TextStyle(
                              color: Color(0xfffe554a),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                backgroundColor: Color(0xffF8FBFF),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 21),
                    child: Icon(Icons.photo,color: Colors.red,),
                  )
                ],
                leading: Container(
                  height: 40.w,
                  width: 40.h,
                  padding: EdgeInsets.only(left: 21),
                  child: IconButton(
                    onPressed: ()async {
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: "husseinhamed@example.com", password: "SuperSecretPassword!");
                      String d =await userCredential.user!.getIdToken();
                      print(d);


                    },
                    icon: Icon(
                      Icons.sort,
                      color: Colors.black,
                    ),
                  ),
                )),
          ),
          body: Container(
            color: Color(0xffF8FBFF),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(40),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 287.h,
                    height: 31.w,
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Enjoy Delicious food",
                      style: TextStyle(
                          color: Color(0xff3D3D3D),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  CustomSizedBox(50),
                  Container(
                    width: double.infinity,
                    height: 109.w,
                    padding: EdgeInsets.only(left: 20.w),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 109.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(
                                    color: Color(0xff3EC032),
                                    width: 1.h,
                                  )),
                              width: 82.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffA9E88B).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(50.r)),

                              child: Column(
                                //  crossAxisAlignment: CrossAxisAlignment.center,
                                //  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomSizedBox(22),
                                  Expanded(
                                    child: Container(
                                      child: Icon(
                                        Icons.emoji_food_beverage,
                                        // size: 24.h,
                                      ),
                                      height: 24.w,
                                      width: 24.h,
                                    ),
                                  ),
                                  // CustomSizedBox(7),
                                  Expanded(
                                    child: Container(
                                      height: 24.w,
                                      width: 45.h,
                                      child: Text(
                                        "Burger",
                                        style: TextStyle(fontSize: 12.sp),
                                      ),

                                      alignment: Alignment.center,
                                    ),

                                  ),
                                  CustomSizedBox(10),
                                ],
                              ),
                              // alignment: Alignment.center,
                              height: 87.w,
                              width: 65.h,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 22.h,
                        );
                      },
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  CustomSizedBox(50),
                  Container(
                    padding: EdgeInsets.only(left: 24,right: 20),
                    height: 321.w,
                    child: Column(
                      children: [
                        Container(
                          height: 21.w,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text("Popular restaurants",style: TextStyle(
                                  fontSize: 16.sp,fontWeight: FontWeight.w700
                              ),),
                              Spacer(),
                              Text("View all(29)",style: TextStyle(
                                  fontSize:14.sp,decoration: TextDecoration.underline,color: Color(0xffFE554A)
                              ),)
                            ],
                          ),

                        ),
                        CustomSizedBox(40),
                        Container(

                          width: double.infinity,
                          height: 260.w,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(top: 15,right: 15,left: 15),
                                height: 260.w,
                                width: 200.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.r),
                                  // border: Border.all(
                                  //   color: Color(0xff3EC032),
                                  //  // width: 1.w,
                                  // )
                                ),
                                child: Column(
                                  children: [
                                    Container(

                                      height: 112.w,
                                      width: 170.h,
                                      child: Image.asset("images/burger.png"),
                                    ),
                                    CustomSizedBox(20),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 21.w,
                                      child: Text("Big cheese burger",style: TextStyle(
                                        fontSize: 16.sp,fontWeight: FontWeight.w700,color: Color(0xff3D3D3D),
                                      ),),
                                    ),
                                    CustomSizedBox(5),
                                    Container(
                                        height: 36.w,
                                        child: Text("No 10 opp lekki phase 1 bridge in sangotedo estate",style: TextStyle(
                                            fontSize: 12.sp,color: Color(0xff3D3D3D),fontWeight: FontWeight.w400
                                        ),)),
                                    CustomSizedBox(12),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding:  EdgeInsets.only(left: 4),
                                            child: IconButton(
                                              icon: Icon(Icons.star,color: Color(0xffF5A62E),size: 15.w,),
                                              onPressed: () {

                                              },
                                              padding: EdgeInsets.zero,
                                            ),
                                            height: 15.w,
                                            width: 15.h,

                                            // alignment: Alignment.center,
                                          ),
                                          SizedBox(
                                            width: 4.h,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(top: 4,),
                                            child: Text("4+",style: TextStyle(

                                                fontSize: 12.sp,fontWeight: FontWeight.w400
                                            ),),
                                            height: 18.w,
                                            width: 18.h,

                                          ),
                                          Spacer(),
                                          Container(


                                            child: IconButton(
                                              icon: Icon(Icons.favorite,color: Color(0xffFE554A),size: 18.h,),
                                              onPressed: () {

                                              },
                                              padding: EdgeInsets.zero,
                                            ),
                                            height: 15.w,
                                            width: 15.h,
                                            // alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),

                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 22.h,
                              );
                            },
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(50),
    //     child: AppBar(
    //         elevation: 0,
    //         centerTitle: true,
    //         title: Container(
    //           alignment: Alignment.center,
    //           //height: 45.h,
    //           //width: 133.w,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     alignment: Alignment.center,
    //                     height: 21.h,
    //                     width: 64.w,
    //                     child: AutoSizeText(
    //                       "Delivery to",
    //                       style: TextStyle(
    //                           color: Color(0xff1C1C1C),
    //                           fontSize: 14.sp,
    //                           fontWeight: FontWeight.w400,
    //                           decoration: TextDecoration.underline),
    //                       maxLines: 1,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 10.w,
    //                   ),
    //                   Icon(
    //                     Icons.keyboard_arrow_down_outlined,
    //                     color: Colors.black,
    //                   )
    //                 ],
    //               ),
    //               CustomSizedBox(1),
    //               Container(
    //                 alignment: Alignment.center,
    //                 //height: 23.h,
    //                 width: 133.w,
    //                 child: AutoSizeText(
    //                   "lekki phase 1, Estate",
    //                   style: TextStyle(
    //                       color: Color(0xfffe554a),
    //                       fontSize: 15.sp,
    //                       fontWeight: FontWeight.w400,
    //                       decoration: TextDecoration.underline),
    //                   maxLines: 1,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         backgroundColor: Color(0xffF8FBFF),
    //         actions: [
    //           Padding(
    //             padding: EdgeInsets.only(right: 21),
    //             child: Icon(Icons.photo,color: Colors.red,),
    //           )
    //         ],
    //         leading: Container(
    //           height: 40.h,
    //           width: 40.w,
    //           padding: EdgeInsets.only(left: 21),
    //           child: IconButton(
    //             onPressed: () {},
    //             icon: Icon(
    //               Icons.sort,
    //               color: Colors.black,
    //             ),
    //           ),
    //         )),
    //   ),
    //   body: Container(
    //     color: Color(0xffF8FBFF),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           CustomSizedBox(40),
    //           Container(
    //             alignment: Alignment.centerLeft,
    //             width: 287.w,
    //             height: 31.h,
    //             padding: EdgeInsets.only(left: 24),
    //             child: Text(
    //               "Enjoy Delicious food",
    //               style: TextStyle(
    //                   color: Color(0xff3D3D3D),
    //                   fontSize: 24.sp,
    //                   fontWeight: FontWeight.w700),
    //             ),
    //           ),
    //           CustomSizedBox(50),
    //           Container(
    //             width: double.infinity,
    //             height: 109.h,
    //             padding: EdgeInsets.only(left: 20.w),
    //             child: ListView.separated(
    //               itemBuilder: (context, index) {
    //                 return Stack(
    //                   alignment: Alignment.center,
    //                   children: [
    //                     Container(
    //                       height: 109.h,
    //                       decoration: BoxDecoration(
    //                           color: Colors.white,
    //                           borderRadius: BorderRadius.circular(50.r),
    //                           border: Border.all(
    //                             color: Color(0xff3EC032),
    //                             width: 1.w,
    //                           )),
    //                       width: 82.w,
    //                     ),
    //                     Container(
    //                       decoration: BoxDecoration(
    //                           color: Color(0xffA9E88B).withOpacity(0.2),
    //                           borderRadius: BorderRadius.circular(50.r)),
    //
    //                       child: Column(
    //                         //  crossAxisAlignment: CrossAxisAlignment.center,
    //                         //  mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           CustomSizedBox(22),
    //                           Expanded(
    //                             child: Container(
    //                               child: Icon(
    //                                 Icons.emoji_food_beverage,
    //                                 // size: 24.h,
    //                               ),
    //                               height: 24.h,
    //                               width: 24.w,
    //                             ),
    //                           ),
    //                           // CustomSizedBox(7),
    //                           Expanded(
    //                             child: Container(
    //                               height: 24.h,
    //                               width: 45.w,
    //                               child: Text(
    //                                 "Burger",
    //                                 style: TextStyle(fontSize: 12.sp),
    //                               ),
    //
    //                               alignment: Alignment.center,
    //                             ),
    //
    //                           ),
    //                           CustomSizedBox(10),
    //                         ],
    //                       ),
    //                       // alignment: Alignment.center,
    //                       height: 87.h,
    //                       width: 65.w,
    //                     ),
    //                   ],
    //                 );
    //               },
    //               separatorBuilder: (context, index) {
    //                 return SizedBox(
    //                   width: 22.w,
    //                 );
    //               },
    //               itemCount: 4,
    //               scrollDirection: Axis.horizontal,
    //             ),
    //           ),
    //           CustomSizedBox(50),
    //           Container(
    //             padding: EdgeInsets.only(left: 24,right: 20),
    //             height: 321.h,
    //             child: Column(
    //               children: [
    //                 Container(
    //                   height: 21,
    //                   width: double.infinity,
    //                   child: Row(
    //                     children: [
    //                       Text("Popular restaurants",style: TextStyle(
    //                           fontSize: 16.sp,fontWeight: FontWeight.w700
    //                       ),),
    //                       Spacer(),
    //                       Text("View all(29)",style: TextStyle(
    //                           fontSize:14.sp,decoration: TextDecoration.underline,color: Color(0xffFE554A)
    //                       ),)
    //                     ],
    //                   ),
    //
    //                 ),
    //                 CustomSizedBox(40),
    //                 Container(
    //
    //                   width: double.infinity,
    //                   height: 260.h,
    //                   child: ListView.separated(
    //                     itemBuilder: (context, index) {
    //                       return Container(
    //                         padding: EdgeInsets.only(top: 15,right: 15,left: 15),
    //                         height: 260.h,
    //                         width: 200.w,
    //                         decoration: BoxDecoration(
    //                           color: Colors.white,
    //                           borderRadius: BorderRadius.circular(50.r),
    //                           // border: Border.all(
    //                           //   color: Color(0xff3EC032),
    //                           //  // width: 1.w,
    //                           // )
    //                         ),
    //                         child: Column(
    //                           children: [
    //                             Container(
    //
    //                               height: 112.h,
    //                               width: 170.w,
    //                               child: Image.asset("images/burger.png"),
    //                             ),
    //                             CustomSizedBox(20),
    //                             Container(
    //                               alignment: Alignment.centerLeft,
    //                               height: 21.h,
    //                               child: Text("Big cheese burger",style: TextStyle(
    //                                 fontSize: 16.sp,fontWeight: FontWeight.w700,color: Color(0xff3D3D3D),
    //                               ),),
    //                             ),
    //                             CustomSizedBox(5),
    //                             Container(
    //                                 height: 36.h,
    //                                 child: Text("No 10 opp lekki phase 1 bridge in sangotedo estate",style: TextStyle(
    //                                     fontSize: 12.sp,color: Color(0xff3D3D3D),fontWeight: FontWeight.w400
    //                                 ),)),
    //                             CustomSizedBox(12),
    //                             Container(
    //                               child: Row(
    //                                 children: [
    //                                   Container(
    //                                     padding:  EdgeInsets.only(left: 4),
    //                                     child: IconButton(
    //                                       icon: Icon(Icons.star,color: Color(0xffF5A62E),size: 15.h,),
    //                                       onPressed: () {
    //
    //                                       },
    //                                       padding: EdgeInsets.zero,
    //                                     ),
    //                                     height: 15.h,
    //                                     width: 15.w,
    //
    //                                     // alignment: Alignment.center,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 4.w,
    //                                   ),
    //                                   Container(
    //                                     padding: const EdgeInsets.only(top: 4,),
    //                                     child: Text("4+",style: TextStyle(
    //
    //                                         fontSize: 12.sp,fontWeight: FontWeight.w400
    //                                     ),),
    //                                     height: 18.h,
    //                                     width: 18.w,
    //
    //                                   ),
    //                                   Spacer(),
    //                                   Container(
    //
    //
    //                                     child: IconButton(
    //                                       icon: Icon(Icons.favorite,color: Color(0xffFE554A),size: 18.h,),
    //                                       onPressed: () {
    //
    //                                       },
    //                                       padding: EdgeInsets.zero,
    //                                     ),
    //                                     height: 15.h,
    //                                     width: 15.w,
    //                                     // alignment: Alignment.center,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //
    //                           ],
    //                         ),
    //
    //                       );
    //                     },
    //                     separatorBuilder: (context, index) {
    //                       return SizedBox(
    //                         width: 22.w,
    //                       );
    //                     },
    //                     itemCount: 4,
    //                     scrollDirection: Axis.horizontal,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
