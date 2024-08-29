import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHandler{

  Database? _database;
  
  Future<Database?> get database async{

    //if database is already created
    if(_database != null){ 
      return _database;
  }
    //First of all creating path
    Directory directory =await getApplicationDocumentsDirectory();
    // file will be created with name of 'mydatabase.db'
    String path = join(directory.path,'mydatabase.db');
    //opening file and creating table
    _database = await openDatabase(path,version: 1,onCreate: (db,version){
      db.execute(
        '''
        CREATE TABLE DatabaseTable(
        id INTEGER PRIMARY KEY AUTO INCREMENT,
        name TEXT,
        age INTEGER 
        )
        ''');
    });
    return _database;
  }

  //for inserting data
  insertData(int id, String name, int age) async{
    Database? db = await database;
    Map<String , dynamic> map = {
      'id' : id,
      'name' : name,
      'age' : age
    };
    db!.insert('DatabaseTable', map);
  }
  
  //for reading data
  readData() async{
    Database? db = await database;
    final list =await  db!.query('DatabaseTable');
    return list;
  }

  //for deleting data
  deleteData(int id) async{
    Database? db = await database;
    await db!.delete(
      'DatabaseTable',where: 'id = ?',whereArgs: [id]);
  }

  //for updating data
  updateData(int id, Map<String,dynamic> data) async{
      Database? db = await database;
      await db!.update('DatabaseTable', data,
      where: 'id = ?',
      whereArgs: [id]);
  }
}