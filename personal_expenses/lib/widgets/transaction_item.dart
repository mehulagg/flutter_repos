import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text("\$${transaction.amount.toStringAsFixed(2)}"),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor,
                ),
                icon: const Icon(CupertinoIcons.delete),
                label: const Text('Delete'),
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: const Icon(FluentIcons.delete_24_filled),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
