import 'package:path/path.dart';
import 'package:sekolahku/data/model/user.dart';
import 'package:sekolahku/data/model/student.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  static const _databaseName = 'school.db';
  static const _userTable = 'user';
  static const _studentTable = 'student';
  static const _databaseVersion = 1;

  static const _sqlCreateUserTable = '''
    CREATE TABLE $_userTable (
      userId INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    );
    ''';

  static const _sqlCreateStudentTable = '''
    CREATE TABLE $_studentTable (
      studentId INTEGER PRIMARY KEY AUTOINCREMENT,
      phoneNumber TEXT,
      firstName TEXT,
      lastName TEXT,
      gender TEXT,
      degree TEXT,
      photo TEXT,
      address TEXT,
      hobbies TEXT
    );
    ''';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db =
        openDatabase(join(path, _databaseName), onCreate: (db, version) async {
      await db.execute(_sqlCreateUserTable);
      await db.execute(_sqlCreateStudentTable);
    }, version: _databaseVersion);
    return db;
  }

  Future<void> insertUser(User user) async {
    final Database db = await database;
    await db.insert(_userTable, user.toMap());
    print('User data saved!');
  }

  Future<User> checkUser(String username, String password) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _userTable,
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    for (var result in results) {
      return Future<User>.value(User.fromMap(result));
    }
    return Future<User>.error('Username atau Password salah!');
  }

  Future<void> insertStudent(Student student) async {
    final Database db = await database;
    await db.insert(_studentTable, student.toMap());
    print('Student data saved!');
  }

  Future<List<Student>> getStudents() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_studentTable);
    return results.map((res) => Student.fromMap(res)).toList();
  }

  Future<Student> getStudentById(int studentId) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _studentTable,
      where: 'studentId = ?',
      whereArgs: [studentId],
    );
    return results.map((res) => Student.fromMap(res)).first;
  }

  Future<void> updateStudent(Student student) async {
    final Database db = await database;
    await db.update(
      _studentTable,
      student.toMap(),
      where: 'studentId = ?',
      whereArgs: [student.studentId],
    );
    print('Student data updated!');
  }

  Future<void> deleteStudent(int studentId) async {
    final Database db = await database;
    await db.delete(
      _studentTable,
      where: 'studentId = ?',
      whereArgs: [studentId],
    );
    print('Student data deleted!');
  }
}
