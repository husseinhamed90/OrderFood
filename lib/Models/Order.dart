import 'package:orderfood/Models/Meal.dart';

class Order{
  late String id;
  List<Meal>meals=[];

  Order(this.id,this.meals);

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    for(int i=0;i<json['Meals'].length;i++){
      meals.add(Meal.fromJson(json['Meals'][i]));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Meals']=meals.map((e) => e.toJson()).toList();
    return data;
  }
}