import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/cart.dart';
import 'package:provider_learn/providers/products_provider.dart';
import 'package:provider_learn/screeens/cart_screen.dart';
import 'package:provider_learn/screeens/product_detail_screen.dart';
import 'package:provider_learn/screeens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => Cart())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
              CartScreen.routeName:(context) =>const CartScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
