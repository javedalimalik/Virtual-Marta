import 'shop_model.dart';

import 'order_detail.dart';

class OrderModel {
  int id, items, status, shopId, userId;
  String name;
  String phone;
  String address;
  String date;
  double price, deliveryFee;
  ShopModel shop;
  List<OrderDetail> detail;

  OrderModel(
      {this.id,
        this.userId,
        this.name,
        this.phone,
        this.address,
        this.date,
        this.shopId,
        this.price,
        this.deliveryFee,
        this.items,
        this.status,
        this.shop,
        this.detail});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    userId = int.parse(json['userId']);
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    date = json['date'];
    shopId = int.parse(json['shopId']);
    price = double.parse(json['price']);
    deliveryFee = double.parse(json['deliveryFee']);
    items = int.parse(json['items']);
    status = int.parse(json['status']);
    shop = json['shop'] != null ? new ShopModel.fromJson(json['shop']) : null;
    if (json['detail'] != null) {
      detail = new List<OrderDetail>();
      json['detail'].forEach((v) {
        detail.add(new OrderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['date'] = this.date;
    data['shopId'] = this.shopId;
    data['price'] = this.price;
    data['deliveryFee'] = this.deliveryFee;
    data['items'] = this.items;
    data['status'] = this.status;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    return data;
  }
}