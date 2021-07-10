class Restaurant{
  late String ? restaurantname;
  late String? path;
  late String ? address;
  late String ?rate;

  Restaurant(this.restaurantname,this.address,this.rate,this.path);

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantname = json['restaurantname'];
    address = json['address'];
    rate =json['rate'];
    path=json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantname'] = this.restaurantname;
    data['address'] = this.address;
    data['rate'] =this.rate;
    data['path']=this.path;
    return data;
  }

}