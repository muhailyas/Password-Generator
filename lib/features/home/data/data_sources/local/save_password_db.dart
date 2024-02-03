import 'package:password_generator/features/home/data/models/save_password.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';
import 'package:sqflite/sqflite.dart';

class SavePasswordService {
  SavePasswordService._();
  static final SavePasswordService instance = SavePasswordService._();
  factory SavePasswordService() => instance;

  late Database _db;

  Future initializeDatabase() async {
    _db = await openDatabase(
      'saved.passwords',
      version: 1,
      onCreate: (db, version) => db.execute(
          'CREATE TABLE Password(id INTEGER PRIMARY KEY,title TEXT,password TEXT,date TEXT)'),
    );
  }

  Future<SavePasswordEntity> savePassword(
      SavePasswordModel savePassword) async {
    await _db
        .rawInsert('INSERT INTO Password(title,password,date) VALUES(?,?,?)', [
      savePassword.title,
      savePassword.password,
      savePassword.date,
    ]);
    return SavePasswordModel(
        title: savePassword.title,
        password: savePassword.password,
        date: savePassword.date);
  }

  Future<List<SavePasswordEntity>> getAllSavedPasswords() async {
    List<Map<String, Object?>> list =
        await _db.rawQuery('SELECT * FROM Password');
    return list.map((json) => SavePasswordModel.fromJson(json)).toList();
  }
}
