import 'package:orderfood/Models/Meal.dart';

class Category{
   String ?path;
   String ?name;
   String categoryId="";
   List<Meal>meals=[];
  Category(this.path,this.name);

  Category.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    name = json['name'];
    categoryId=json['categoryId'];
    print(json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['name'] = this.name;
    data['categoryId']=this.categoryId;
   // data['meals']=meals.map((e) => e.toJson()).toList();
    return data;
  }
}