import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:orderfood/BuildFavouritePage.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Charachter.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:orderfood/Profile.dart';
import 'package:orderfood/Repository.dart';
import 'package:orderfood/Services.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/BuildHomePage.dart';
import 'package:sqflite/sqflite.dart';
class AppCubit extends Cubit<CubitState>{
  Repository repository;
  late Database database;
  Future<void> CreateDataBase()async{
    database =await openDatabase(
      "Cart.db"
      ,version: 1,
      onCreate: (db, version) {
        db.execute("CREATE TABLE Cart (id INTEGER PRIMARY KEY,MealName TEXT, Description TEXT ,Price INTEGER ,quantity INTEGER)").then((value) {
          print("Table is Created");
        });
      },onOpen: (db) {
      print("Database is Opened");
    },).then((value) {
      print("DataBase Created");
      return value;

    });
  }
  PageController controller =new PageController();

  AppCubit(this.repository) : super(initialState()){
   repository =new Repository();
   CreateDataBase();
  }
  List<Widget>pages=[
    BuildHomePage(),
    BuildFavouritePage(),
    BuildCartPage(),
    Profile(),
  ];
  int currentindex=0;
  int currentflipindex=0;
  Widget currentpage = BuildHomePage();
  late User user;

  late List<Restaurant> resturants;
  late List<Meal> PopularMeals;
  late List<Category>categories;
  //late List<int>indexes;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> UpdateProfileInfo(UserAccount newaccount)async{
    //account=newaccount;
    emit(LoadingIndicator());
    await Services.UpdateProfile(newaccount,account!.id,this);

  }
  void IncreamentCartNumber(Meal meal){
    meal.quantity++;
    emit(quantityofMealIncreased());

  }
  void DecreaseCartNumber(Meal meal){
    if(meal.quantity!=0)
      meal.quantity--;
    emit(quantityofMealDecreased());
  }
  void AddMealToCart(Meal meal){
    meal.quantity++;
    InsertIntoDatabase(meal).then((value) {
      emit(AddMealToCartLoadingState());
      FirebaseFirestore.instance.collection("Users").doc(account!.id).update(account!.toJson()).then((value) {
        account!.Meals.add(meal);
        emit(MealAddedToAccount());
      });
    });
  }

  Future InsertIntoDatabase(Meal meal)async{
    database.transaction((txn) {
      //MealName TEXT, Description TEXT ,Price REAL ,quantity INTEGER
      return txn.rawInsert('INSERT INTO Cart (MealName, Description, Price, quantity) VALUES ("${meal.mealname}","${meal.description}",${meal.mealprice},${meal.quantity})').then((value) {
        print(value);
        print("Record added Successfully");
      });
//      INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)
    });
  }

  void AddMealToFavourite(Meal meal){
    account!.Meals.add(meal);
    FirebaseFirestore.instance.collection("Users").doc(account!.id).update(account!.toJson());
    emit(MealAddedToFavourite());
  }
  bool IsMealInFavourites(){
    return true;
  }
  void updateaccount(UserAccount userAccount){
     account =userAccount;
     currentindex=0;
     currentpage=pages[0];
     emit(AccountisUpdated());
  }
  void SetInitialControllerPage(){
    controller=PageController(initialPage: currentflipindex);
    emit(setcontroll());
  }
  void changeposition(int newposition){
    currentpage=pages[newposition];
    currentindex=newposition;
    emit(positionchanged());
  }
  void SetSearchPage(){
    //currentpage=BuildHomePage();
   // emit(positionchanged());
  }
  Future<void>AddMealToItem(Meal meal)async{

  }

  void goToNextPage (PageController controller){

    controller.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
   // emit(GoToNextPageState());
  }
  UserAccount ?account;
  Future<void> register (String username,String password,String confirmpassword,String name)async{

    if(username==""||password ==""|| confirmpassword==""){
      emit(EmptyFeildsFound());
    }
    else{
      emit(LoadingIndicator());
      if(password ==confirmpassword){
        account =await Services.Register(username, password,name)??null;

        if(account!=null){
          await LoadData().then((value) {
            emit(ValidUserState());
          });
        }
        else{
          emit(InvalidUserState());
        }
      }
      else{
        emit(InvalidRegisteration());
      }
    }



  }

  int currentcategoryposition=0;
  Future<void> changecurrentcategory(int index)async{
    currentcategoryposition=index;
    emit(positionchanged());
  }
  void Login(String username,String password)async{
    emit(LoadingIndicator());
    account  =await Services.Login(username, password)??null;
    print(account);
    if(account!=null){
      await LoadData().then((value) {
        emit(ValidUserState());
      });

    }
    else{
      emit(InvalidUserState());
    }
  }
  Future<void>LoadData()async{
    emit(LoadingIndicator());
    print("loading is begin");
    //await GetAllResturants();
    await GetAllCategories();
    await GetPopularMeals();
    emit(DataisInLoaded());
  }

  Future<void> GetAllResturants()async{
   // emit(loadingCategorieeFromFireBase());
    await repository.getresturants().then((value) {
      this.resturants=value;
     // emit(LoadingIsFinished());
    });
  }
  // Future<void>savenewdata()async{
  //   PopularMeals.forEach((element) {
  //       FirebaseFirestore.instance.collection("PopularMeals").add(element.toJson()).then((value) {
  //         FirebaseFirestore.instance.collection("PopularMeals").doc(value.id).update({"id":value.id});
  //       });
  //   });
  // }

  Future<void> GetPopularMeals()async{
    // emit(loadingCategorieeFromFireBase());
    await repository.getPopularMeals().then((value) {
      this.PopularMeals=value;
      // emit(LoadingIsFinished());
    });
  }
  Future<void> GetAllCategories()async{
   // emit(loadingCategorieeFromFireBase());
      await repository.getCategories().then((value) {
      this.categories=value;
      // for(int i=0;i<categories.length;i++){
      //   indexes.add(i);
      // }
     // emit(LoadingIsFinished());
    });
  }
}