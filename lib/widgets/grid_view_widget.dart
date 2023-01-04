import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/products_provider.dart';
import 'package:provider_learn/widgets/product_item.dart';

class GridviewWidget extends StatelessWidget {
  const GridviewWidget({super.key, required this.showFav});
  final bool showFav;

  @override
  Widget build(BuildContext context) {
   final productsData= Provider.of<ProductsProvider>(context);
   final products=showFav?productsData.favItems: productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create: (context) => products[index],
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageurl: products[index].imageurl
            ),
      ),
    );
  }
}
