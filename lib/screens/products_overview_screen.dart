import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
// import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              )
            ],
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
