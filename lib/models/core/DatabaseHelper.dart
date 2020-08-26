

import 'dart:io';

import 'package:FlutterChallenge/models/Contato.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  //Variaveris ara criar colinas na base de dados
  String contaTable= 'contato';
  String colId= 'id';
  String colNome= 'nome';
  String colEmail= 'email';
  String colImage= 'image';
  //Base de Dados
  Database _database;
  static DatabaseHelper _databaseHelper;

  DatabaseHelper._createInstance();

  //Metodo que garante que so uma instancia de Base de Dados seja retornado
  factory DatabaseHelper(){
    if(_databaseHelper == null){

      _databaseHelper=DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future <Database> get database async {

    //Verifica se a base de Dados e nula
    if(_database == null){
      _database = await initializeDatabase(); //Recebe uma instancia de Base de Dados
    }

  }

  //Metodo para inicializar a Base de Daos
  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'contactos.db';

    var contatosDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return contatosDatabase;
  }

  //Metodo para criar a Base de Dados
  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $contaTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNome TEXT, ''$colEmail TEXT, $colImage TEXT)');

  }


  //Inserir contacto na Base de Dados
  Future<int> insertContato(Contato contato) async{
    Database db = await this._database;
    var resultado = await db.insert(contaTable, contato.toMap());
    return resultado;
  }

  //Obter Contacto
  Future<Contato> getContato(int id) async {

    Database db= this._database;
    List<Map> maps= await db.query(contaTable, columns: [colId, colNome, colImage], where: "$colId =?", whereArgs: [id]);

    //Verifica se recebeu alguma coisa
if(maps.length>0){
  return Contato.fromMap(maps.first);
}
else{
  return null;
}

  }


  //Apagar Contacto
  Future<int> deleteContacto(int id) async{

    var db= await this._database;
    int resultado= await db.delete(contaTable,where: "$colId = ?", whereArgs: [id]);
    return resultado;
  }

}