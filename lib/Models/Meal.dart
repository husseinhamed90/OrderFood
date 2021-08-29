class Meal{

  late String mealname,path,description;
  String mealID="";
  dynamic mealprice=0;
  int quantity=0;
  String categoryId="";

  Meal(this.mealname, this.mealprice,this.path);

  Meal.fromJson(Map<String, dynamic> json) {
    mealname = json['mealname'];
    description=json['description'];
    mealprice = json['mealprice'];
    mealID = json['mealID'];
    path=json['path'];
    print(json['categoryId']);
    categoryId=json['categoryId'];
    quantity = json['quantity'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealname'] = this.mealname;
    data['description'] = this.description;
    data['mealprice'] = this.mealprice;
    data['mealID'] = this.mealID;
    data['categoryId']=this.categoryId;
    data['path']=this.path;
    data['quantity'] = this.quantity;
    return data;
  }
}