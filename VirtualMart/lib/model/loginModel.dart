class loginModel {
  String id;
  String name;
  String phone;
  String password;
  Shop shop;
  String message;
  bool success;

  loginModel(
      {this.id,
        this.name,
        this.phone,
        this.password,
        this.shop,
        this.message,
        this.success});

  loginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Shop {
  String id;
  String ownerId;
  String name;
  String address;
  String phone;
  String lat;
  String lng;
  String image;

  Shop(
      {this.id,
        this.ownerId,
        this.name,
        this.address,
        this.phone,
        this.lat,
        this.lng,
        this.image});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    lat = json['lat'];
    lng = json['lng'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['image'] = this.image;
    return data;
  }
}