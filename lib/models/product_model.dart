class ProductModel{
  late int id;
  late dynamic price;
  late String title;
  late String description;
  late String image;
  late String category;
  late RatingModel ratingModel;
  ProductModel.fromJson(json){
    id = json["id"];
    price = json['price'];
    title = json["title"];
    description = json["description"];
    image = json["image"];
    category = json["category"];
    ratingModel= RatingModel.fromJson(json["rating"]);
  }
}

class RatingModel{
  late dynamic rate;
  late int count;
  RatingModel.fromJson(json){
    rate = json["rate"];
    count = json["count"];
  }
}