import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db =await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database?> initialDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'expense.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade
    );
    return mydb;
  }
_onUpgrade(Database db,int oldVersion,int newVersion){


}

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE expenses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL,
        category TEXT,
        date TEXT,
        note TEXT
      ) 
''');
    print("oncreate========================================");
  }

  selectData(String sql)async{
    Database? mydb=await db;
    List<Map> response=await mydb!.rawQuery(sql);
    return response;
  }

   insertData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawInsert(sql);
    
    return response;
  }

   updateData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawUpdate(sql);
    return response;
  }

   deleteData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawDelete(sql);
    return response;
  }
}
