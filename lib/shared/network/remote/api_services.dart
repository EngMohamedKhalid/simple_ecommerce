import 'package:simple_ecommerce/models/add_product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_ecommerce/models/login_model.dart';
import 'package:simple_ecommerce/models/product_model.dart';
class ApiServices{
  Future<AddProductModel> addProduct({
    required String title,
    required String desc,
    required String image,
    required String category,
    required dynamic price,
  })async{
    http.Response response = await http.post(
        Uri.parse("https://fakestoreapi.com/products"),
        body: {
          "title": title,
          "price": price,
          "description": desc,
          "image":image,
          "category": category

        }
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return AddProductModel.fromJson(data);
  }

  Future<http.Response> deleteProduct ({
    required int id,
  })async{
    return await http.delete(
      Uri.parse("https://fakestoreapi.com/products/$id"),
    );
  }

  Future<List<ProductModel>> getAllProducts()async{
    http.Response response = await  http.get(Uri.parse("https://fakestoreapi.com/products"));
    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> productList = [];
    for (var element in data) {
      productList.add(ProductModel.fromJson(element));
    }
    return productList;
  }
  Future<LoginModel> signIn({
    required String username,
    required String password,
  })async{
    http.Response response = await http.post(
        Uri.parse("https://fakestoreapi.com/auth/login"),
        body: {
          "username":username,
          "password": password,
        }
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return LoginModel.fromJson(data);
  }

  Future<AddProductModel> updateProduct({
    required int id,
    required String title,
    required dynamic price,
    required String desc,
    required String image,
    required String category,
  })async{
    http.Response response = await http.put(
        Uri.parse("https://fakestoreapi.com/products/$id"),
        body: {
          "title":title,
          "price": price,
          "description": desc,
          "image": image,
          "category": category
        }
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return AddProductModel.fromJson(data);
  }
}