class LoginModel{
  late String token;
  LoginModel.fromJson(Map<String,dynamic> json){
    token = json["token"];
  }
}