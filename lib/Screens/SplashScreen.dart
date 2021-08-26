import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'FirstTip.dart';
class SplashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 110,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1),
              duration: const Duration(milliseconds: 3000),
              builder: (context, value, child) {
                return Container();
              },
              onEnd: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => FirstTip()
                ));
              },
            ),
          ),
          Container(
            child: Center(child: Image.asset("images/logo.png",height: 72.h,width: 105.w,)),
          ),
        ],
      ),
    );
  }
}
