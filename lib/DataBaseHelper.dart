import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto/CategoryDetailsPage.dart';

final List<String> tableNames = [
  "novel",
  "fiction",
  "educational",
  "childrens_books"
];

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();

  static Database? _database;

  DataBaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!; //Retornamos la base si no existe.

    _database = await _initDB('mobileapp.db'); //La creamos
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final nameType = "varchar(50) NOT NULL";
    final descriptionType = "varchar(300) NOT NULL";
    final cover_addressType = "varchar(50) NOT NULL";

    await db.execute('''
      CREATE TABLE $tableNames[0] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );

      CREATE TABLE $tableNames[1] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );

      CREATE TABLE $tableNames[2] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );

      CREATE TABLE $tableNames[3] (
      ${BookFields.id} $idType,
      ${BookFields.name} $nameType,
      ${BookFields.description} $descriptionType,
      ${BookFields.cover_address} $cover_addressType,
      );
    ''');
  }

  Future<List<Map<String, dynamic>>> getBooks(String category) async {
    final db = await database;
    return await db.query(category);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
