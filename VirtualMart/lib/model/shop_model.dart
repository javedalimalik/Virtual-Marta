class ShopModel {
  int id, ownerId;
  String name;
  String address;
  String phone;
  double lat;
  double lng;
  String image;

  ShopModel(
      {this.id,
        this.ownerId,
        this.name,
        this.address,
        this.phone,
        this.lat,
        this.lng,
        this.image});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    ownerId = int.parse(json['owner_id'].toString());
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    lat = double.parse(json['lat'].toString());
    lng = double.parse(json['lng'].toString());
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
