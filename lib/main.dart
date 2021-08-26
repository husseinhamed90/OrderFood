import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Repository.dart';
import 'Screens/SplashScreen.dart';
import 'package:sqflite/sqflite.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late Database database;

  @override
  Widget build(BuildContext context) {

    return  FutureBuilder<Database>(
      future: CreateDataBase(),
      builder: (context, snapshot) {
        if(snapshot.data!=null){
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AppCubit(Repository(),snapshot.data)),
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

  Future<Database> CreateDataBase()async{
     return await openDatabase(
      "Cart.db"
      ,version: 1,
      onCreate: (db, version) {
        db.execute("CREATE TABLE Cart (id INTEGER PRIMARY KEY,mealname TEXT, description TEXT ,mealprice REAL ,quantity INTEGER ,userID TEXT,path TEXT,mealID TEXT)").then((value) {
          print("Table is Created");
        });
        db.execute("CREATE TABLE Favourites (id INTEGER PRIMARY KEY,mealname TEXT, description TEXT ,mealprice REAL ,quantity INTEGER ,userID TEXT,path TEXT,mealID TEXT)").then((value) {
          print("Table is Created");
        });
      },onOpen: (db) {
      print("Database is Opened");
    },).then((value) {
      print("DataBase Created");
      database=value;
      return value;

    });
  }
}
