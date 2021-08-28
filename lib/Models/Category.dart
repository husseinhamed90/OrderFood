import 'package:orderfood/Models/Meal.dart';

class Category{
   String ?path;
   String ?name;
   List<Meal>meals=[];
  Category(this.path,this.name);

  Category.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    name = json['name'];
    for(int i=0;i<json['meals'].length;i++){
      meals.add(Meal.fromJson(json['meals'][i]));
    }

    print(meals);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['name'] = this.name;
    data['meals']=meals.map((e) => e.toJson()).toList();
    return data;
  }
}