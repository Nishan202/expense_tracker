import 'package:expense_tracker/Database/data_model.dart';
import 'package:expense_tracker/Database/db_provider.dart';
import 'package:expense_tracker/Model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      // required this.expense,
      // required this.onRemoveExpense,
      });

  // final Expense expense;
  // final DataModel dataModel;
  // final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
      final Expense expense;
    // return ListView.builder(
    //   itemCount: expenses.length,
    //   itemBuilder: (ctx, index) => Dismissible(
    //     key: ValueKey(expenses[index]),
    //     background: Container(
    //       color: Theme.of(context).colorScheme.error.withOpacity(0.75),
    //       margin: EdgeInsets.symmetric(
    //         horizontal: Theme.of(context).cardTheme.margin!.horizontal,
    //       ),
    //     ),
    //     onDismissed: (direction) {
    //       onRemoveExpense(expenses[index]);
    //     },
    //     child: ExpenseItem(
    //       expenses[index],
    //     ),
    //   ),
    // );

    return Consumer<DbProvider>(builder: (_, provider, __) {
      var mData = provider.getData();
      return mData.isNotEmpty
          ? ListView.builder(
              itemCount: mData.length,
              itemBuilder: (_, index) {
                // return Dismissible(key: key, child: child)
                return Card(
                  // child: ListTile(
                  //   title: Text(mData[index].title),
                  //   subtitle: Text(mData[index].amount as String),
                  //   trailing: Row(
                  //     children: [
                  //       Icon(categoryIcons[dataModel.category]),
                  //       Text(DateFormat.yMd().format(mData[index].date))
                  //     ],
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mData[index].title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '\$${mData[index].amount}',
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                // Icon(categoryIcons[expense.category]),
                                const SizedBox(width: 8),
                                Text(
                                    DateFormat.yMd().format(mData[index].date)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })
          : const Center(
              child: Text('No notes yet!!'),
            );
    });
  }
}
