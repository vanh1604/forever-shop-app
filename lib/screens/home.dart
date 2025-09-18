import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = SearchController();
    print(_searchController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dreamabtme Shop'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SearchAnchor.bar(
                  searchController: _searchController,
                  barHintText: 'Tìm kiếm sản phẩm...',
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                        return List<Widget>.generate(5, (int index) {
                          return ListTile(title: Text('Gợi ý ban đầu $index'));
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
      ),
    );
  }
}
