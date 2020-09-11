import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'UserModel.dart';
import 'package:path_provider/path_provider.dart';

class LoginDB {
  final String nameTable = 'logi';
  final String colUser = 'user';
  final String colPass = 'password';
  Database _database;
  static LoginDB loginDB;

  LoginDB._createInstance();

  factory LoginDB() {
    if (loginDB == null) loginDB = LoginDB._createInstance();
    return loginDB;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'login.db';
    var loginDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return loginDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('create table $nameTable($colUser Text, $colPass Text)');
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await this.database;
    var result = db.rawQuery('Select * from $nameTable');
    return result;
  }

  Future<User> getUser(String username, String password) async {
    Database db = await this.database;
    var maps = await db.query(nameTable,
        columns: [colUser, colPass],
        where: '$colUser=? and $colPass=?',
        whereArgs: [username, password]);
    if (maps.length > 0) return User.fromMap(maps.first);
    return null;
  }

  Future<int> insertUser(String username, String password) async {
    Database db = await this.database;
    User user = User(username, password);
    print(user.toMap());
    var result = await db.insert(nameTable, user.toMap());
    //var result = await db.rawInsert(
    //  "Insert into $nameTable($colUser, $colPass) values($username, $password)");
    print(result);
    return result;
  }
}
