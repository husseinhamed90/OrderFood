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

  static Future<UserAccount?> Register(UserAccount account)async{
    try {
      UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: account.username,
          password: account.password
      );
      account.id=userCredential.user!.uid;
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

  static Future<bool> addData(Meal meal,String categoryId)async {
    meal.categoryId=categoryId;
    CollectionReference meals = FirebaseFirestore.instance.collection('Meals');
    print(categoryId);
    return meals.add(meal.toJson()).then((value) async{
      await meals.doc(value.id).update({"mealID":value.id,'mealname':"french"});
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
        .then((QuerySnapshot querySnapshot) async {

          for(int i=0;i<querySnapshot.docs.length;i++){
           List<Meal>meals = await getMealsOfSpecificCategory(querySnapshot.docs[i]['categoryId']);
           Category category =Category.fromJson(querySnapshot.docs[i].data() as Map<String, dynamic>);
           category.meals=meals;
           restaurants.add(category);
           print("fffffffff");
           print(category.meals);
          }
    });
    return restaurants;
  }

  static Future<List<Meal>> getMealsOfSpecificCategory(String categoryId) async{
    List<Meal>restaurants=[];
    await FirebaseFirestore.instance
        .collection('Meals').where("categoryId",isEqualTo: categoryId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for(int i=0;i<querySnapshot.docs.length;i++){

        restaurants.add(Meal.fromJson(querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    });
    return restaurants;
  }



  static Future<List<dynamic>> getData() async{
    Response response;
    var dio = Dio(BaseOptions(
      baseUrl: "https://www.breakingbadapi.com/api/"
    ));
    response = await dio.get('characters');
    return response.data;
  }
}