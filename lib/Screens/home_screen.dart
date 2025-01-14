import 'package:expense_tracker/Database/db_provider.dart';
import 'package:expense_tracker/Model/expense.dart';
import 'package:expense_tracker/Screens/add_expense.dart';
import 'package:expense_tracker/Widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<HomeScreen> {

  // final List<Expense> _registeredExpenses = [
  //   Expense(
  //     title: 'Flutter Course',
  //     amount: 19.99,
  //     date: DateTime.now(),
  //     category: Category.work,
  //   ),
  //   Expense(
  //     title: 'Cinema',
  //     amount: 15.69,
  //     date: DateTime.now(),
  //     category: Category.leisure,
  //   ),
  // ];

  @override
  void initState(){
    super.initState();
    context.read<DbProvider>().fetchInitialData();
  }
  
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(),
    );
  }

  // void _addExpense(Expense expense) {
  //   setState(() {
  //     _registeredExpenses.add(expense);
  //   });
  // }

  // void _removeExpense(Expense expense) {
  //   final expenseIndex = _registeredExpenses.indexOf(expense);
  //   setState(() {
  //     _registeredExpenses.remove(expense);
  //   });
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       duration: const Duration(seconds: 3),
  //       content: const Text('Expense deleted.'),
  //       action: SnackBarAction(
  //         label: 'Undo',
  //         onPressed: () {
  //           setState(() {
  //             _registeredExpenses.insert(expenseIndex, expense);
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(),
          ),
        ],
      ),
    );
  }
}
