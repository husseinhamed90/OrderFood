import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Models/UserAccount.dart';


class Services{

  static Future<UserAccount?> Login(String username,String password)async{
    try {
      UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password
      );
       Map<String,dynamic> dd =await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).get().then((value) {
         return value.data()!;
        });
       return UserAccount.fromJson(dd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  static Future<UserAccount?> Register(String username,String password,String name,String phoneNumber)async{
    try {
      UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: password
      );
      UserAccount account =UserAccount(username, password,name,userCredential.user!.uid,phoneNumber);
      DocumentReference documentReference = FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid);
      documentReference.set(account.toJson());
      return account;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
     // return false;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void>UpdateProfile(UserAccount userAccount,String id,AppCubit appCubit)async{

     await FirebaseFirestore.instance.collection("Users").doc(id).update(userAccount.toJson()).then((value) async {
       print(userAccount.username);
       FirebaseAuth _auth = FirebaseAuth.instance;
       User? user = _auth.currentUser;

       AuthCredential credentials = EmailAuthProvider.credential(email: appCubit.account!.username, password: appCubit.account!.password);
       await user!.reauthenticateWithCredential(credentials).then((value){
         value.user!.updateEmail('${userAccount.username}').then((valueeee) {
           value.user!.updatePassword(userAccount.password);

           appCubit.updateaccount(userAccount);
         });
       });
     });
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

  static Future<List<Meal>> getPopularMeals() async{
    List<Meal>meals=[];
    await FirebaseFirestore.instance
        .collection('PopularMeals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for(int i=0;i<querySnapshot.docs.length;i++){
        meals.add(Meal.fromJson(querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    });
    return meals;
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
  }
}