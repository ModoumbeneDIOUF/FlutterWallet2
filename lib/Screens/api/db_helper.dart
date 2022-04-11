import 'package:nafa_money/Model/contact_favori.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();


    Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'contactFavories.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

   Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contactFavories(
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT

      )
      ''');
  }

   Future<List<ContactFavories>> getContacts() async {
    Database db = await instance.database;
    var contact = await db.query('contactFavories', orderBy: 'id',limit: 3);
    List<ContactFavories> contactFavoriesList = contact.isNotEmpty
        ? contact.map((c) => ContactFavories.fromMap(c)).toList()
        : [];
    return contactFavoriesList;
  }

   Future<int> add(ContactFavories contact) async {
    Database db = await instance.database;

     var contactExitant = await db.query('contactFavories', where: "phone = ?", whereArgs: [contact.phone]);
    
     if (contactExitant.length == 0 ) {

        var contactDeja = await db.query('contactFavories', orderBy: 'id',limit: 3);
        if(contactDeja.length == 3){

             var contactASupprimer = await db.rawQuery("SELECT MIN(id) as maxId FROM contactFavories");
              print(contactASupprimer.first['maxId']);
              await db.delete('contactFavories', where: 'id = ?', whereArgs: [contactASupprimer.first['maxId']]);
              return await db.insert('contactFavories', contact.toMap());
              
        }
        else{
            return await db.insert('contactFavories', contact.toMap());
        }
      
       
     } else {

       return 0;

     }

    
  }

   Future<int> remove(int id) async {

    Database db = await instance.database;
    
    return await db.delete('contactFavories', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(ContactFavories contact) async {
    Database db = await instance.database;
    return await db.update('contactFavories', contact.toMap(),
        where: "phone = ?", whereArgs: [contact.phone]);
  }
}

