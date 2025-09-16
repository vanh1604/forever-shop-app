import 'package:first_project/models/product.dart';
import 'package:flutter/material.dart';

class Productitem extends StatelessWidget {
  const Productitem({super.key, required this.productItem});
  final Product productItem;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(productItem.image[0], fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productItem.name),
                const SizedBox(height: 4),
                Text('\$${productItem.price.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
