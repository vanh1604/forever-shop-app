import 'package:first_project/api_service.dart';
import 'package:first_project/models/auth_state.dart';
import 'package:first_project/models/product.dart';
import 'package:first_project/store/authNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final apiProvider = Provider((ref) {
  return ApiService();
});

final productsListProvider = FutureProvider<List<Product>>((ref) async {
  return ref.watch(apiProvider).fetchData();
});

final productById = FutureProvider.family<Product, String>((ref, id) async {
  return ref.watch(apiProvider).fetchProductById(id);
});

final categoriesProvider = FutureProvider((ref) async {
  return ref.watch(apiProvider).fetchCategories();
});
final slidersProvider = FutureProvider((ref) async {
  return ref.watch(apiProvider).fetchSlider();
});
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  final apiService = ref.watch(apiProvider);
  return AuthNotifier(apiService);
});
