import 'dart:convert';
import 'package:first_project/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://forever-backend-gamma-two.vercel.app';
  Future<List<Product>> fetchData() async {
    final res = await http.get(Uri.parse('$baseUrl/api/product/list'));
    if (res.statusCode == 200) {
      if (res.body == 'null') {
        return [];
      }
      final Map<String, dynamic> data = jsonDecode(res.body);
      final List<dynamic> productListData = data['products'];
      return productListData
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
