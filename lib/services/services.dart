import 'dart:convert';
import 'package:marienatie/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUser() async {
  final response =
      await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));

  if (response.statusCode == 200) {
    return UserModel.fromJsonList(jsonDecode(response.body));
  } else {
    throw Exception("Failed to add user");
  }
}