import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/providers/cart.dart';

class CartItemS extends StatelessWidget {
  const CartItemS(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.quantity, required this.productId})
      : super(key: key);
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding:const EdgeInsets.only(
          right: 20,
        ),
        margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child:const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      child: Card(
        margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('\$$price'),
              )),
            ),
            title: Text(title),
            subtitle: Text('\$${(price * quantity)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
