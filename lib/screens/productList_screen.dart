import 'package:first_project/store/api_provider.dart';
import 'package:first_project/widgets/productItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductlistScreen extends ConsumerWidget {
  const ProductlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productsListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: productList.when(
        data: (products) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Productitem(productItem: product);
            },
          );
        },
        error: (error, stack) {
          final errorMessage = error.toString();
          return Text(errorMessage);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
