class ImageModel{
  int id;
  String image, color;

  ImageModel({this.id, this.image, this.color});

  ImageModel.fromJson(Map<String, dynamic> json){
    id = int.parse(json['id'].toString());
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}