// import 'package:expense_tracker/Database/data_model.dart';
// import 'package:expense_tracker/Model/expense.dart';
// import 'package:flutter/material.dart';

// class ExpenseItem extends StatelessWidget {
//   ExpenseItem({required this.dataModel, required this.expense});

//   DataModel dataModel;
//   final Expense expense;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 16,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               dataModel.title,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             const SizedBox(height: 4),
//             Row(
//               children: [
//                 Text(
//                   '\$${dataModel.amount.toStringAsFixed(2)}',
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     Icon(categoryIcons[expense.category]),
//                     const SizedBox(width: 8),
//                     Text(),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }