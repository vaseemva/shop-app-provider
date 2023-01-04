import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
const ProductDetailScreen({ Key? key,  }) : super(key: key);
// final String title;
static const routeName='/product-detail';

  @override
  Widget build(BuildContext context){
    final proId=ModalRoute.of(context)?.settings.arguments as String;
  final loadedProduct= Provider.of<ProductsProvider>(context,listen: false).findById(proId);
    return Scaffold(appBar: AppBar(
      title: Text(loadedProduct.title),
    ),);
  }
}