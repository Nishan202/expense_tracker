import 'package:expense_tracker/Database/data_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  // glbal static variable for table and columns
  static const String EXPENSE_TABLE = 'expense';
  static const String COLUMN_EXPENSE_ID = 'expense_id';
  static const String COLUMN_EXPENSE_TITLE = 'expense_title';
  static const String COLUMN_EXPENSE_AMOUNT = 'expense_amount';
  static const String COLUMN_EXPENSE_DATE = 'expense_date';

// to privatize the constructor
  DBHelper._();

// Singleton Object
  static DBHelper getInstense() => DBHelper._();

  Database? mDB;

  Future<Database> getDB () async {
    // if(mDB != null){
    //   return mDB!;
    // } else {
    //   mDB = await openDB();
    //   return mDB!;
    // }
    // ? : Else -> This is more sorter version than previous
    // return mDB!= null ? mDB! : await openDB();
    // we can make it one line -> This is most sorter version
    return mDB ??= await openDB();
  }
  // Step 1 -> Open DB if created ?? then open, if Not then first create DB then open
  Future<Database> openDB()async{
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");
    return await openDatabase(dbPath,version: 1, onCreate: (db , version){
      db.execute(
        'CREATE TABLE $EXPENSE_TABLE ($COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_EXPENSE_TITLE TEXT, $COLUMN_EXPENSE_AMOUNT REAL, $COLUMN_EXPENSE_DATE TEXT)'
      );
    });
  }

// Add data in Database
  Future<bool> addNote ({required DataModel newNote}) async {
    var db = await getDB();

    int rowsEffected = await db.insert(EXPENSE_TABLE, newNote.toMap());
    return rowsEffected > 0;
  }

// Update data in Database
  Future<bool> updateNote ({required DataModel updateNote}) async {
    var db = await getDB();

    int rowsEffected = await db.update(EXPENSE_TABLE, updateNote.toMap(), where: "$COLUMN_EXPENSE_ID = ${updateNote.id}");
    return rowsEffected > 0;
  }

  // Delete data from Database
  Future<bool> deleteNote ({required int id}) async {
    var db = await getDB();

    int rowsEffected = await db.delete(EXPENSE_TABLE , where: "$COLUMN_EXPENSE_ID = $id");
    return rowsEffected > 0;
  }

// Fetch data from Database
  Future<List<DataModel>> fetchAllData() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(EXPENSE_TABLE);
    List<DataModel> mNotes = [];
    for(int i=0; i<mData.length; i++){
      DataModel dataModel = DataModel.fromMap(mData[i]);
      mNotes.add(dataModel);
    }

    return mNotes;
  }
}