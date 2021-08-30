import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Network/Local/Sqflite.dart';
import 'Screens/SplashScreen.dart';
import 'package:sqflite/sqflite.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late Database database;

  @override
  Widget build(BuildContext context) {

    return  FutureBuilder<Database>(
      future: SqfLite.init(),
      builder: (context, snapshot) {
        if(snapshot.data!=null){

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AppCubit()),
            ],
            child: ScreenUtilInit(
              builder: () =>  MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    textTheme: GoogleFonts.tajawalTextTheme(
                      Theme.of(context).textTheme,
                    ),
                  ),
                  home: SplashScreen()
              ),
              designSize: Size(375,812),
            ),
          );
        }
        else{
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
