import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Charachter.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Repository.dart';
import 'package:orderfood/Services.dart';
class AppCubit extends Cubit<CubitState>{
  Repository repository;

  AppCubit(this.repository) : super(initialState()){
   repository =new Repository();
  }
  
   late List<Restaurant> resturants;
   late List<Category>categories;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  void register (String username,String password,String confirmpassword)async{
    emit(LoadingIndicator());
    if(password ==confirmpassword){
      bool valid =await Services.Register(username, password);
      if(valid){
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
  void Login(String username,String password)async{
    emit(LoadingIndicator());
    bool valid =await Services.Login(username, password);
    if(valid){
      emit(ValidUserState());
    }
    else{
      emit(InvalidUserState());
    }
  }
  // void Savadata(){
  //   categories.forEach((element) {
  //     Services.adddata(element);
  //   });
  // }
  Future<void>LoadData()async{
    emit(LoadingIndicator());
    await GetAllResturants();
    await GetAllCategories();
    emit(DataisInLoaded());
  }
  Future<void> GetAllResturants()async{
    await repository.getresturants().then((value) {
      this.resturants=value;
    });
  }
  Future<void> GetAllCategories()async{
    await repository.getCategories().then((value) {
      this.categories=value;
    });
  }
}