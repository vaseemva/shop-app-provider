import 'package:flutter/material.dart';
import 'package:provider_learn/screeens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: const Text('Shop'),
            leading: const Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Orders'),
            leading: const Icon(Icons.payment),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
