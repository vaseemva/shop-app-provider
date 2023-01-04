import 'package:flutter/material.dart';
import 'package:provider_learn/providers/product.dart';

class ProductsProvider with ChangeNotifier{
final List<Product>_items=[
    Product(
        id: 'p1',
        title: 'first',
        description: 'jksfjkhsdj',
        price: 200.1,
        imageurl:
            'https://img.mensxp.com/media/shop/catalog/products/W/645904/white-cotton-shirt-default.jpg'),
    Product(
        id: 'p2',
        title: 'second',
        description: 'jksfjkhsdj',
        price: 200.1,
        imageurl:
            'https://img.mensxp.com/media/shop/catalog/products/W/645904/white-cotton-shirt-default.jpg'),
    Product(
        id: 'p3',
        title: 'third',
        description: 'jksfjkhsdj',
        price: 200.1,
        imageurl:
            'https://img.mensxp.com/media/shop/catalog/products/W/645904/white-cotton-shirt-default.jpg')
  ];
List<Product>get items{
  return [..._items];
}

List<Product> get favItems{
  return _items.where((element) => element.isFavourite).toList();
}

Product findById(String id){
  return _items.firstWhere((element) => element.id==id);
}

void addProduct(){
  // _items.add(value);
  notifyListeners();
}
}