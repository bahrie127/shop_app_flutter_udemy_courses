import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show CartItem;
import '../providers/cart.dart' show Cart;

class CartItemWidget extends StatelessWidget {
  final String id;
  final CartItem item;

  CartItemWidget(this.id, this.item);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(item.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('\$${item.price}'),
                ),
              ),
            ),
            title: Text(item.title),
            subtitle: Text('Total: \$${(item.price * item.quantity)}'),
            trailing: Text('${item.quantity} x'),
          ),
        ),
      ),
    );
  }
}
