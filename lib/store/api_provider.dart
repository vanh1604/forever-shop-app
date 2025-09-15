import 'package:first_project/api_service.dart';
import 'package:first_project/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider((ref) {
  return ApiService();
});

final productsListProvider = FutureProvider<List<Product>>((ref) async {
  return ref.watch(apiProvider).fetchData();
});
