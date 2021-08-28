import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Services.dart';

class Repository{

  Repository();


  Future<List<Restaurant>>getresturants() async{
    final list =await Services.getResturants();
    return list;
  }

  Future<List<Category>>getCategories() async{
    final list =await Services.getCategories();
    return list;
  }

}