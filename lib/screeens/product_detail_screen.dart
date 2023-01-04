import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);
// final String title;
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final proId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductsProvider>(context, listen: false).findById(proId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageurl),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$ ${loadedProduct.price}',
              style:const TextStyle(fontSize: 25),
            ),
            Text(loadedProduct.description)
          ],
        ),
      ),
    );
  }
}
