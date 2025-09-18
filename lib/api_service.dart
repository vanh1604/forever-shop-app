import 'dart:convert';
import 'dart:math';
import 'package:first_project/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://be-kappa-sand.vercel.app/services/api';
  Future<List<Product>> fetchData() async {
    final res = await http.get(Uri.parse('$baseUrl/products'));
    if (res.statusCode == 200) {
      if (res.body == 'null') {
        return [];
      }
      print(res.body);
      final Map<String, dynamic> data = jsonDecode(res.body);
      final List<dynamic> productListData = data['data'];
      return productListData
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProductById(String id) async {
    final res = await http.get(Uri.parse('$baseUrl/products/$id'));
    print(res.body);
    if (res.statusCode == 200) {
      if (res.body == 'null') {
        return Future.error('Product not found');
      }
      final Map<String, dynamic> data = jsonDecode(res.body);
      // return Product.fromJson(data);
      final Map<String, dynamic> productById = data['data'];
      return Product.fromJson(productById);
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    final bodyMap = {'email': email, 'password': password};
    final res = await http.post(
      Uri.parse('$baseUrl/users/user/login'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(bodyMap),
    );
    if (res.statusCode == 200) {
      if (res.body == 'null') {
        return Future.error('User not found');
      }
      final Map<String, dynamic> data = jsonDecode(res.body);
      return data;
    } else {
      throw Exception('Failed to login. Server says: ${res.body}');
    }
  }

  Future<dynamic> fetchCategories() async {
    final res = await http.get(Uri.parse('$baseUrl/categories'));
    if (res.statusCode == 200) {
      if (res.body == 'null') {
        return [];
      }
      final Map<String, dynamic> data = jsonDecode(res.body);
      final List<dynamic> categories = data['data'];
      return categories.map((category) => Category.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<dynamic> fetchSlider() async {
    final res = await http.get(Uri.parse('$baseUrl/sliders'));
    if (res.statusCode == 200) {
      if (res.body == 'null') {
        return;
      }
      print(res.body);
      final Map<String, dynamic> data = jsonDecode(res.body);
      final List<dynamic> sliders = data['data'];
      return sliders;
    } else {
      throw Exception('Failed to load sliders');
    }
  }
}
