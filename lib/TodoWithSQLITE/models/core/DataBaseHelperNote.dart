import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../note.dart';

class DatabaseHelperNote {
  //Variaveris ara criar colinas na base de dados
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';
  //Base de Dados
  Database _database;
  static DatabaseHelperNote _databaseHelper;

  DatabaseHelperNote._createInstance();

  //Metodo que garante que so uma instancia de Base de Dados seja retornado
  factory DatabaseHelperNote() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelperNote._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    //Verifica se a base de Dados e nula
    if (_database == null) {
      _database =
          await initializeDatabase(); //Recebe uma instancia de Base de Dados
    }
  }

  //Metodo para inicializar a Base de Daos
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  //Metodo para criar a Base de Dados
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result =
        db.rawQuery('Select * from $noteTable order by $colPriority ASC');
    return result;
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId= ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    var result =
        await db.rawDelete('Delete from $noteTable where $colId = $id');
    return result;
  }

  Future<int> getCount(int id) async {
    Database db = await this.database;
    var result =
        await db.rawDelete('Delete from $noteTable where $colId = $id');
    return result;
  }

  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;

    List<Note> noteList = List<Note>();

    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMap(noteMapList[i]));
    }
    return noteList;
  }
}
