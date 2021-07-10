import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Charachter.dart';
import 'package:orderfood/Models/Restaurant.dart';

class Services{


  static Future<bool> Login(String username,String password)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  static Future<bool> Register(String username,String password)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: password
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;

    }
  }

  static Future<bool> adddata(Category restaurant)async {
    CollectionReference users = FirebaseFirestore.instance.collection('Categories');
    return users.add(restaurant.toJson()).then((value) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });

  }

  static Future<List<Category>> getCategories() async{
    List<Category>restaurants=[];
    await FirebaseFirestore.instance
        .collection('Categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
          for(int i=0;i<querySnapshot.docs.length;i++){
           restaurants.add(Category.fromJson(querySnapshot.docs[i].data() as Map<String, dynamic>));
          }
    });
    return restaurants;
  }

  static Future<List<Restaurant>> getResturants() async{
    List<Restaurant>restaurants=[];
    await FirebaseFirestore.instance
        .collection('Meals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for(int i=0;i<querySnapshot.docs.length;i++){
        restaurants.add(Restaurant.fromJson(querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    });
    return restaurants;
  }

  static Future<List<dynamic>> getdata() async{
    Response response;
    var dio = Dio(BaseOptions(
      baseUrl: "https://www.breakingbadapi.com/api/"
    ));
    response = await dio.get('characters');
    return response.data;
// Optionally the request above could also be done as
  }
}