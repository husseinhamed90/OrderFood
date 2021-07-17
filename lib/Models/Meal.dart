class Meal{

  late String mealname,id;
  late double mealprice;
  late int quantity;
  late bool isInFavouriteList,isInCartList;

  Meal(this.mealname, this.id, this.mealprice, this.quantity,
      this.isInFavouriteList, this.isInCartList);

  Meal.fromJson(Map<String, dynamic> json) {
    mealname = json['username'];
    mealprice = json['Password'];
    id = json['id'];
    quantity = json['quantity'];
    isInFavouriteList = json['isInFavouriteList'];
    isInCartList = json['isInCartList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mealname'] = this.mealname;
    data['mealprice'] = this.mealprice;
    data['id'] = this.id;
    data['isInFavouriteList'] = this.isInFavouriteList;
    data['isInCartList'] = this.isInCartList;
    data['quantity'] = this.quantity;
    return data;
  }
}