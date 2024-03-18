import 'package:hoja/model/size_model.dart';

class ProductModel {
  String id;
  String name;
  List<Product> product;

  ProductModel({this.id, this.name, this.product});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['product'] != null) {
      product = new List<Product>();
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String id;
  String name;
  String description;
  String price;
  String discount;
  Shop shop;
  List<Rating> rating;
  List<SizeModel> size;
  List<Images> images;

  Product(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.discount,
        this.shop,
        this.rating,
        this.size,
        this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    if (json['rating'] != null) {
      rating = new List<Rating>();
      json['rating'].forEach((v) {
        rating.add(new Rating.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = new List<SizeModel>();
      json['size'].forEach((v) {
        size.add(new SizeModel.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.map((v) => v.toJson()).toList();
    }
    if (this.size != null) {
      data['size'] = this.size.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
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

class Rating {
  String id;
  String userId;
  String productId;
  String rating;
  String comment;

  Rating({this.id, this.userId, this.productId, this.rating, this.comment});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    productId = json['product_id'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_Id'] = this.userId;
    data['product_id'] = this.productId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}

class Images {
  String id;
  String productId;
  String image;
  String color;

  Images({this.id, this.productId, this.image, this.color});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}
