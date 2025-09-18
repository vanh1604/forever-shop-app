import 'package:first_project/store/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _searchController = SearchController();
    final categories = ref.watch(categoriesProvider);
    final sliders = ref.watch(slidersProvider);
    print(sliders);
    print(_searchController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dreamabtme Shop'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: SearchAnchor.bar(
                      searchController: _searchController,
                      barHintText: 'Tìm kiếm sản phẩm...',
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                            return List<Widget>.generate(5, (int index) {
                              return ListTile(
                                title: Text('Gợi ý ban đầu $index'),
                              );
                            });
                          },
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Cart'),
                    icon: Icon(Icons.shopify),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: Banner(
                message: 'Banner',
                location: BannerLocation.topEnd,
                child: categories.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) =>
                      Center(child: Text(error.toString())),
                  data: (listOfCategories) {
                    if (listOfCategories.isEmpty) {
                      return const Center(child: Text('Không có danh mục nào'));
                    }
                    final firstCategory = listOfCategories[0];
                    return Image.network(firstCategory.image);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            const Text(
              'Danh sách danh mục',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                categories.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) =>
                      Center(child: Text(error.toString())),
                  data: (listOfCategories) {
                    return Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listOfCategories.length,
                          itemBuilder: (context, index) {
                            final category = listOfCategories[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Chip(label: Text(category.name)),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
