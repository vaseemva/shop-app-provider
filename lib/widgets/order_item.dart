import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_learn/providers/orders.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key, required this.orderItem}) : super(key: key);
  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${orderItem.amount}'),
            subtitle:
                Text(DateFormat('dd MM yyyy hh:mm').format(orderItem.dateTime)),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
