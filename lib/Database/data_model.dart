import 'package:expense_tracker/Database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class DataModel {
  int id;
  String title;
  num amount;
  DateTime date;
  Category category;

  // String get formattedDate {
    // return formatter.
  // }

  DataModel({this.id = 0, required this.title, required this.amount, required this.date, required this.category});

  // fromMap
  factory DataModel.fromMap(Map<String, dynamic> map){
    return DataModel(id: map[DBHelper.COLUMN_EXPENSE_ID], title: map[DBHelper.COLUMN_EXPENSE_TITLE], amount: map[DBHelper.COLUMN_EXPENSE_AMOUNT], date: map[DBHelper.COLUMN_EXPENSE_DATE], category: map[DBHelper.COLUMN_EXPENSE_CATEGORY]);
  }

  // toMap -> when we need to return data as Map
  Map<String, dynamic> toMap (){
    return {
      DBHelper.COLUMN_EXPENSE_TITLE : title,
      DBHelper.COLUMN_EXPENSE_AMOUNT : amount,
      DBHelper.COLUMN_EXPENSE_DATE : date,
      DBHelper.COLUMN_EXPENSE_CATEGORY : category
    };
  }

}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.dataModel,
  });

  ExpenseBucket.forCategory(List<DataModel> allExpenses, this.category)
      : dataModel = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<DataModel> dataModel;

  double get totalExpenses {
    double sum = 0;

    for (final expense in dataModel) {
      sum += expense.amount; // sum = sum + expense.amount
    }

    return sum;
  }
}