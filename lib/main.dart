// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Repository.dart';
import 'package:orderfood/splashScreen.dart';
import 'package:sqflite/sqflite.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Repository repository;


  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit(repository)),
      ],
      child: ScreenUtilInit(
        builder: () =>  MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.tajawalTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: splashScreen()
        ),
        designSize: Size(375,812),
        //designSize: Size(812,375),
      ),
    );
  }
}
