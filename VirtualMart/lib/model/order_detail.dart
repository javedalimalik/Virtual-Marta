import 'product_model.dart';

class OrderDetail {
  int itemId, orderId, quantity, size;
  double price;
  double discount;
  ProductModel item;

  OrderDetail(
      {this.orderId,
        this.itemId,
        this.quantity,
        this.price,
        this.discount,
        this.size,
        this.item});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    orderId = int.parse(json['orderId']);
    itemId = int.parse(json['itemId']);
    quantity = int.parse(json['quantity']);
    price = double.parse(json['price']);
    discount = double.parse(json['discount']);
    size = int.parse(json['size']);
    item = json['item'] != null ? new ProductModel.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['itemId'] = this.itemId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['size'] = this.size;
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    return data;
  }
}