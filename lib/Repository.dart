import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Charachter.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Services.dart';

class Repository{

  Repository();
  Future<List<Charachter>>getdata() async{


    final list =await Services.getdata();
    return list.map((v)=>(Charachter.fromJson(v))).toList();
// Optionally the request above could also be done as
  }


  Future<List<Restaurant>>getresturants() async{
    final list =await Services.getResturants();
    return list;
  }

  Future<List<Category>>getCategories() async{
    final list =await Services.getCategories();
    return list;
  }
  Future<List<Meal>>getPopularMeals() async{
    final list =await Services.getPopularMeals();
    return list;
  }

}