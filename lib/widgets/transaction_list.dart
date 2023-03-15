import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTx;
  TransactionList(this.transactions, this.removeTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text("No transaction added yet"),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: ((context, index) => Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: FittedBox(
                              child:
                                  Text(transactions[index].amount.toString()),
                            ),
                          ),
                          title: Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              removeTx(transactions[index].id);
                            },
                          ),
                        ),
                      )),
                ),
              ));
  }
}
// Row(
                      //   children: [
                      //     Container(
                      //         padding: EdgeInsets.all(10),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: Theme.of(context).primaryColor,
                      //                 width: 2)),
                      //         margin: EdgeInsets.symmetric(
                      //             vertical: 10, horizontal: 20),
                      //         child: Text(
                      //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 20,
                      //               color: Theme.of(context).primaryColor),
                      //         )),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           transactions[index].title,
                      //           style: Theme.of(context).textTheme.titleLarge,
                      //         ),
                      //         Text(
                      //           DateFormat()
                      //               .add_yMMMd()
                      //               .format(transactions[index].date),
                      //           style: TextStyle(color: Colors.grey),
                      //         )
                      //       ],
                      //     )
                      //   ],
                      // )