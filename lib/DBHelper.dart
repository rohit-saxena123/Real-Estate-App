import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'employees.db');

    // Open/create the database at a given path
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    // Create table
    await db.execute(
        'CREATE TABLE Employee(id INTEGER PRIMARY KEY, name TEXT, number TEXT, email TEXT, password TEXT)');
  }

  // Insert employee
  Future<int> insertEmployee(Employee employee) async {
    var client = await db;
    return client.insert('Employee', employee.toMap());
  }
}

class Employee {
  String name;
  String number;
  String email;
  String password;

  Employee({required this.name, required this.number, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'number': number,
      'email': email,
      'password': password,
    };
    return map;
  }
}
