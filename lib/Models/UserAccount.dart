import 'package:orderfood/Models/Meal.dart';

class UserAccount{
  late String username,password,name,phoneNumber;
  late String id;
  List<Meal>Meals=[];
  List<Meal>favourite=[];
  Map<String,Meal>mapOfFavouritesMeals={};
  Map<String,Meal>mapOfCartMeals={};

  UserAccount(this.username, this.password,this.name,this.phoneNumber);

  UserAccount.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['Password'];
    id = json['id'];
    name=json['name'];
    for(int i=0;i<json['favourite'].length;i++){
      favourite.add(Meal.fromJson(json['favourite'][i]));
    }
    phoneNumber=json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['Password'] = this.password;
    data['id'] = this.id;
    data['name']=this.name;
    data['favourite']=favourite.map((e) => e.toJson()).toList();
    data['phoneNumber']=this.phoneNumber;
    return data;
  }
}