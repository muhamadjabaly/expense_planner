import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function itemDelet;

  TransactionList(this.transactions, this.itemDelet);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 30,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    '\$ ${transactions[index].amount}',
                  ),
                ),
              ),
            ),
            title: Text(
              transactions[index].text,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(DateFormat.yMMMd().format(transactions[index].time)),
            trailing: MediaQuery.of(context).size.width > 460
                ? FlatButton.icon(
                    onPressed: () => itemDelet(transactions[index].id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    label: Text('Delete'),
                    textColor: Theme.of(context).errorColor,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () => itemDelet(transactions[index].id),
                  ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
