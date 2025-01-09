import 'package:expense_tracker/Database/db_helper.dart';

class DataModel {
  int id;
  String title;
  num amount;
  DateTime date;

  DataModel({this.id = 0, required this.title, required this.amount, required this.date});

  // fromMap
  factory DataModel.fromMap(Map<String, dynamic> map){
    return DataModel(id: map[DBHelper.COLUMN_EXPENSE_ID], title: map[DBHelper.COLUMN_EXPENSE_TITLE], amount: map[DBHelper.COLUMN_EXPENSE_AMOUNT], date: map[DBHelper.COLUMN_EXPENSE_DATE]);
  }

  // toMap -> when we need to return data as Map
  Map<String, dynamic> toMap (){
    return {
      DBHelper.COLUMN_EXPENSE_TITLE : title,
      DBHelper.COLUMN_EXPENSE_AMOUNT : amount,
      DBHelper.COLUMN_EXPENSE_DATE : date
    };
  }

}