import 'package:flutter/material.dart';
import 'package:sekolahku/data/local/database/database_helper.dart';
import 'package:sekolahku/data/model/user.dart';
import 'package:sekolahku/data/model/student.dart';
import 'package:sekolahku/utils/state_enum.dart';

class DatabaseProvider extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;

  List<Student> _students = [];
  List<Student> get students => _students;

  RequestState _studentState = RequestState.Empty;
  RequestState get studentState => _studentState;

  DatabaseProvider() {
    _databaseHelper = DatabaseHelper();
    _getAllStudents();
  }

  Future<void> insertUser(User user) async {
    await _databaseHelper.insertUser(user);
  }

  Future<User> checkUser(String username, String password) async {
    return await _databaseHelper.checkUser(username, password);
  }

  Future<void> insertStudent(Student student) async {
    await _databaseHelper.insertStudent(student);
    _getAllStudents();
  }

  void _getAllStudents() async {
    _studentState = RequestState.Loading;
    _students = await _databaseHelper.getStudents();
    _studentState =
        _students.isNotEmpty ? RequestState.Loaded : RequestState.Empty;
    notifyListeners();
  }

  Future<Student> getStudentById(int studentId) async {
    return await _databaseHelper.getStudentById(studentId);
  }

  void updateStudent(Student student) async {
    await _databaseHelper.updateStudent(student);
    _getAllStudents();
  }

  void deleteStudent(int studentId) async {
    await _databaseHelper.deleteStudent(studentId);
    _getAllStudents();
  }
}
