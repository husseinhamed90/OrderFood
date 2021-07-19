import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/LoginPage.dart';
import 'package:orderfood/Repository.dart';
import 'package:orderfood/Services.dart';
import 'HomePage.dart';
import 'Orders.dart';
import 'package:orderfood/Widgets/CustomAppBar.dart';
import 'package:orderfood/Widgets/CustomButton.dart';
import '../SignUp.dart';
import 'package:orderfood/Widgets/SizedBox.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class FirstTip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).SetInitialControllerPage();

    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {

        if(state is DataisInLoaded){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
      },
      builder: (context, state) {

        if(state is LoadingIndicator){
          return Scaffold(
            body: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: PreferredSize(child: CustomAppBar(() {
            AppCubit.get(context).goToNextPage(AppCubit.get(context).controller);
          },"Skip"),preferredSize: Size.fromHeight(50),),
          body: Container(
            color: Color(0xffF8FBFF),
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                CustomSizedBox(46),
                Container(
                  height: 445.h,
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                    child:   Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 445.h,
                          width: MediaQuery.of(context).size.width,
                          child: PageView(
                            controller: AppCubit.get(context).controller,
                            children: List.generate(
                                3, (_) => Container(
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Container(
                                            width: 255.w,
                                            height: 62.h,
                                            child: Text("Order from your favourite stores or vendors",textAlign: TextAlign.center,style: TextStyle(
                                                fontSize: 24.sp,color: Color(0xff1C1C1C),fontWeight: FontWeight.w700
                                            ),),
                                          )),
                                    ),
                                    CustomSizedBox(45),
                                    Container(
                                        color: Colors.white,
                                        width: 338.w,
                                        height: 255.h,
                                        child: Image.network("https://www.goteso.com/products/assets/images/food-delivery-software.png",height: 255.h,width: 338.w,)
                                    ),

                                  ],
                                ),

                              ),
                            )),
                            onPageChanged: (value){
                              if(value==2){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),));
                                //AppCubit.get(context).LoadData();
                              }
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 35.h,
                          child: Container(
                            child: SmoothPageIndicator(
                              controller: AppCubit.get(context).controller,
                              count: 3,
                              effect: SlideEffect(
                                paintStyle: PaintingStyle.stroke,
                                strokeWidth: 2,
                                dotWidth: 8,
                                spacing: 13,
                                dotHeight: 8,
                                activeDotColor: Color(0xff0B735F),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomSizedBox(60-35),
                Container(
                  width: 325.w,
                  height: 125.h,
                  child: Column(
                    children: [
                      CustomButtom(
                        width: double.infinity,
                        buttoncolor: Color(0xffF9881F),buttonFunction: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      },Buttontext: "Create an account",textStyle: TextStyle(
                          fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w700
                      ),),
                      CustomSizedBox(20),
                      CustomButtom(
                        width: double.infinity,
                        buttoncolor:Colors.white,buttonFunction: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      },Buttontext: "login",textStyle:TextStyle(
                          fontSize: 16.sp,color: Color(0xffFE554A),fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
