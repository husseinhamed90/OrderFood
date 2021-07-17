import 'package:orderfood/Models/Meal.dart';

class UserAccount{
  late String username,Password,name;
  late String id;
   List<Meal>Meals=[];

  UserAccount(this.username, this.Password,this.name,this.id);

  UserAccount.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    Password = json['Password'];
    id = json['id'];
    name=json['name'];
    for(int i=0;i<json['Meals'].length;i++){
      Meals.add(Meal.fromJson(json['Meals'][i]));
    }
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['Password'] = this.Password;
    data['id'] = this.id;
    data['name']=this.name;
    data['Meals']=Meals.map((e) => e.toJson()).toList();
    return data;
  }
}