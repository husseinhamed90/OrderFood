import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:orderfood/BuildFavouritePage.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Charachter.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:orderfood/Profile.dart';
import 'package:orderfood/Repository.dart';
import 'package:orderfood/Services.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/BuildHomePage.dart';
class AppCubit extends Cubit<CubitState>{
  Repository repository;

  PageController controller =new PageController();

  AppCubit(this.repository) : super(initialState()){
   repository =new Repository();
  }
  List<Widget>pages=[
    BuildHomePage(),
    BuildFavouritePage(),
    BuildCartPage(),
    Profile(),
  ];
  int currentindex=0;
  Widget currentpage = BuildHomePage();
  late User user;
  
  late List<Restaurant> resturants;
  late List<Category>categories;
  //late List<int>indexes;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> UpdateProfileInfo(UserAccount newaccount)async{
    //account=newaccount;
    emit(LoadingIndicator());
    await Services.UpdateProfile(newaccount,account!.id,this);

  }
  void updateaccount(UserAccount userAccount){
    account =userAccount;
    print(account!.toJson());
     emit(AccountisUpdated());
  }
  void SetInitialControllerPage(){
    controller=PageController(initialPage: currentindex);
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

  void goToNextPage (PageController controller){

    controller.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
   // emit(GoToNextPageState());
  }
  UserAccount ?account;
  void register (String username,String password,String confirmpassword,String name)async{

    if(username==""||password ==""|| confirmpassword==""){
      emit(EmptyFeildsFound());
    }
    else{
      emit(LoadingIndicator());
      if(password ==confirmpassword){
        account =await Services.Register(username, password,name)??null;
        print("ddddddddddddddddddddd");
        print(account);
        if(account!=null){
          print(account!.toJson());
          emit(ValidUserState());
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
  void changecurrentcategory(int index){
    currentcategoryposition=index;
    emit(positionchanged());
  }
  void Login(String username,String password)async{
    emit(LoadingIndicator());
    account  =await Services.Login(username, password)??null;
    print(account);
    if(account!=null){
      emit(ValidUserState());
    }
    else{
      emit(InvalidUserState());
    }
  }
  Future<void>LoadData()async{
    emit(LoadingIndicator());
    print("loading is begin");
    await GetAllResturants();
    await GetAllCategories();
    emit(DataisInLoaded());
  }
  Future<void> GetAllResturants()async{
   // emit(loadingCategorieeFromFireBase());
    await repository.getresturants().then((value) {
      this.resturants=value;
     // emit(LoadingIsFinished());
    });
  }
  Future<void> GetAllCategories()async{
   // emit(loadingCategorieeFromFireBase());
    print("ffffffffffffffffff");
      await repository.getCategories().then((value) {
      this.categories=value;
      // for(int i=0;i<categories.length;i++){
      //   indexes.add(i);
      // }
     // emit(LoadingIsFinished());
    });
  }
}