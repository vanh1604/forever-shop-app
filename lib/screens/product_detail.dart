import 'package:first_project/store/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetail = ref.watch(productById(id));
    print(productDetail);
    return SafeArea(child: Container());
  }
}
