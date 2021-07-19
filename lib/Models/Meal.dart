class Meal{

  late String mealname,path,description;
  String id="";
  double mealprice=0;
  int quantity=0;

  Meal(this.mealname, this.mealprice,this.path);

  Meal.fromJson(Map<String, dynamic> json) {
    mealname = json['mealname'];
    description=json['description'];
    mealprice = json['mealprice'];
    id = json['id'];
    path=json['path'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealname'] = this.mealname;
    data['description'] = this.description;
    data['mealprice'] = this.mealprice;
    data['id'] = this.id;
    data['path']=this.path;
    data['quantity'] = this.quantity;
    return data;
  }
}