import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/cart.dart';
import 'package:provider_learn/providers/product.dart';
import 'package:provider_learn/screeens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // const ProductItem(
  //     {Key? key, required this.id, required this.title, required this.imageurl})
  //     : super(key: key);
  // final String id;
  // final String title;
  // final String imageurl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: Consumer<Product>(
          builder: (context, product, child) => IconButton(
            icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              product.toggleFavourite();
            },
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            cart.addItem(product.id, product.title, product.price);
          },
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Image.network(
          product.imageurl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
