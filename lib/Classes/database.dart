import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'dart:io';

class Database {

  static var database;

  Future<int> abrirDatabase() async {
    Directory directorio = await getApplicationDocumentsDirectory();
    String caminho = directorio.path + "/challenge.db";
    database = await openDatabase(caminho);



  }


}