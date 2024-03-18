class ProfileInfo {
  Shop shop;
  Report report;

  ProfileInfo({this.shop, this.report});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    report =
    json['report'] != null ? new Report.fromJson(json['report']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    if (this.report != null) {
      data['report'] = this.report.toJson();
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

class Report {
  String newOrders;
  String inProcessOrders;
  String completedOrders;
  String caneclledOrders;
  String expectedEarning;
  String totalEarning;
  Null lastMonthEarning;
  Null lastWeekEarning;

  Report(
      {this.newOrders,
        this.inProcessOrders,
        this.completedOrders,
        this.caneclledOrders,
        this.expectedEarning,
        this.totalEarning,
        this.lastMonthEarning,
        this.lastWeekEarning});

  Report.fromJson(Map<String, dynamic> json) {
    newOrders = json['new_orders'];
    inProcessOrders = json['in_process_orders'];
    completedOrders = json['completed_orders'];
    caneclledOrders = json['caneclled_orders'];
    expectedEarning = json['expected_earning'];
    totalEarning = json['total_earning'];
    lastMonthEarning = json['last_month_earning'];
    lastWeekEarning = json['last_week_earning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new_orders'] = this.newOrders;
    data['in_process_orders'] = this.inProcessOrders;
    data['completed_orders'] = this.completedOrders;
    data['caneclled_orders'] = this.caneclledOrders;
    data['expected_earning'] = this.expectedEarning;
    data['total_earning'] = this.totalEarning;
    data['last_month_earning'] = this.lastMonthEarning;
    data['last_week_earning'] = this.lastWeekEarning;
    return data;
  }
}
