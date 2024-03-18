class RatingModel{
  int id;
  double rating;
  String comment;

  RatingModel({this.id, this.rating, this.comment});

  RatingModel.fromJson(Map<String, dynamic> json){
    id = int.parse(json['id'].toString());
    rating = double.parse(json['rating'].toString());
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}