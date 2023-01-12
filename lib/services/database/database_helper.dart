import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task_model.dart';

import '../../core/utils/app_constants.dart';

class DatabaseHelper {
  static Database? _database;

  static final DatabaseHelper db = DatabaseHelper();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  static initDb() async {
    String path = join(await getDatabasesPath(), AppConstance.dbName);
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE ${AppConstance.dbTableName} (
          ${AppConstance.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${AppConstance.titleColumn} TEXT NOT NULL,
          ${AppConstance.noteColumn} TEXT NOT NULL,
          ${AppConstance.isCompletedColumn} INTEGER NOT NULL,
          ${AppConstance.startTimeColumn} TEXT NOT NULL,
          ${AppConstance.endTimeColumn} TEXT NOT NULL,
          ${AppConstance.dateColumn} TEXT NOT NULL,
          ${AppConstance.colorColumn} TEXT NOT NULL,
          ${AppConstance.remindColumn} INTEGER NOT NULL,
          ${AppConstance.repeatColumn} TEXT NOT NULL        
          )''');
      },
    );
  }

  Future<int> insertTask(TaskModel taskModel) async {
    Database? dbClient = await database;
    int resposne = await dbClient!.insert(
      AppConstance.dbTableName,
      taskModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return resposne;
  }

  Future<int> updateTask( int id) async {
    Database? dbClient = await database;
    int update = await dbClient!.update(
      AppConstance.dbTableName,
      {AppConstance.isCompletedColumn:1},
      where: '${AppConstance.idColumn} = $id',
    );
    return update;
  }

   Future<List<Map<String,dynamic>>> getAllTasks() async {
    Database? dbClient = await database;
    return await dbClient!.query(
      AppConstance.dbTableName,
    );

    
  }

  Future<int> deleteTask(int id) async {
    Database? dbClient = await database;
    return await dbClient!.delete(
      AppConstance.dbTableName,
      where: '${AppConstance.idColumn} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllTasks() async {
    Database? dbClient = await database;
    return await dbClient!.delete(
      AppConstance.dbTableName,
    );
  }
}
