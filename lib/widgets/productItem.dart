import 'package:first_project/models/product.dart';
import 'package:first_project/theme/constants/router_prefix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Productitem extends StatelessWidget {
  const Productitem({super.key, required this.productItem});
  final Product productItem;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('${RouterPrefix.productList}/${productItem.id}');
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(productItem.images[0], fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productItem.name),
                  const SizedBox(height: 4),
                  Text(productItem.price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
