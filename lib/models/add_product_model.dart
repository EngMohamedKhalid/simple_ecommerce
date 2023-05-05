class AddProductModel{
  late int id;
  late dynamic price;
  late String title;
  late String description;
  late String image;
  late String category;
  AddProductModel.fromJson(Map<String,dynamic>json){
    id = json["id"];
    price = json["price"];
    title = json["title"];
    description = json["description"];
    image = json["image"];
    category = json["category"];

  }
}