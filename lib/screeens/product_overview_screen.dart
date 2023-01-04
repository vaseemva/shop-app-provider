import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/cart.dart';
import 'package:provider_learn/screeens/cart_screen.dart';
import 'package:provider_learn/widgets/badge.dart';
import 'package:provider_learn/widgets/grid_view_widget.dart';

enum FilterOptions { all, favourites }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.favourites) {
                  _showOnlyFav = true;
                } else {
                  _showOnlyFav = false;
                }
              });
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: FilterOptions.favourites,
                child: Text('only favourites'),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text('view all'),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
                child: ch!,
                value: cartData.itemCount.toString(),
                color: Colors.red),
            child:
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }, icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: GridviewWidget(
        showFav: _showOnlyFav,
      ),
    );
  }
}
