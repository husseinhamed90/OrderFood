// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
// import 'package:orderfood/BuildFavouritePage.dart';
// import 'package:orderfood/Models/Category.dart';
// import 'package:orderfood/Models/Charachter.dart';
// import 'package:orderfood/Models/Meal.dart';
// import 'package:orderfood/Models/Restaurant.dart';
// import 'package:orderfood/Models/UserAccount.dart';
// import 'package:orderfood/Profile.dart';
// import 'package:orderfood/Repository.dart';
// import 'homecubitstates.dart';
// import 'package:orderfood/Services.dart';
// import 'package:orderfood/Widgets/BuildCartPage.dart';
// import 'package:orderfood/Widgets/BuildHomePage.dart';
//
// class homecubit extends Cubit<homecubitstates> {
//   Repository repository;
//
//   homecubit(this.repository) : super(initialState()) {
//     repository = new Repository();
//   }
//   List<Widget> pages = [
//     BuildHomePage(),
//     BuildFavouritePage(),
//     BuildCartPage(),
//     Profile(),
//   ];
//   static homecubit get(BuildContext context) => BlocProvider.of(context);
//
//   Future<void>LoadData()async{
//     emit(LoadingIndicator());
//     print("loading is begin");
//     //await GetAllResturants();
//     await GetAllCategories();
//     await GetPopularMeals();
//     emit(DataisInLoaded());
//   }
//
//   UserAccount? account;
//   int currentindex = 0;
//   Widget currentpage = BuildHomePage();
//   late List<Meal> PopularMeals;
//   late List<Category> categories;
//   Future<void> UpdateProfileInfo(UserAccount newaccount) async {
//     //account=newaccount;
//     //emit(LoadingIndicator());
//     await Services.UpdateProfile(newaccount, account!.id, this);
//   }
//
//   void updateaccount(UserAccount userAccount) {
//     account = userAccount;
//     print(account!.toJson());
//     // emit(AccountisUpdated());
//   }
//
//   void changeposition(int newposition) {
//     currentpage = pages[newposition];
//     currentindex = newposition;
//     //emit(positionchanged());
//   }
//
//   int currentcategoryposition = 0;
//   void changecurrentcategory(int index) {
//     currentcategoryposition = index;
//     //emit(positionchanged());
//   }
//   Future<void> GetPopularMeals()async{
//     // emit(loadingCategorieeFromFireBase());
//     await repository.getPopularMeals().then((value) {
//       this.PopularMeals=value;
//       // emit(LoadingIsFinished());
//     });
//   }
//   Future<void> GetAllCategories()async{
//     // emit(loadingCategorieeFromFireBase());
//     await repository.getCategories().then((value) {
//       this.categories=value;
//       // for(int i=0;i<categories.length;i++){
//       //   indexes.add(i);
//       // }
//       // emit(LoadingIsFinished());
//     });
//   }
// }
