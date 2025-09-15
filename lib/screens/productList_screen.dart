import 'package:first_project/store/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsScreen extends ConsumerWidget {
  const CommentsScreen({super.key});

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
              return Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(product.image[0], fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('\$${product.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
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
