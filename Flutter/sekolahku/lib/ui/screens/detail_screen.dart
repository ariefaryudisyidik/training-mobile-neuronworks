import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sekolahku/data/local/database/database_provider.dart';
import 'package:sekolahku/data/model/student.dart';
import 'package:sekolahku/ui/components/student_detail.dart';
import 'package:sekolahku/ui/screens/form_screen.dart';
import 'package:sekolahku/ui/screens/home_screen.dart';

class DetailScreen extends StatelessWidget {
  static const route = '/detailScreen';
  final Student student;
  const DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Siswa'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                FormScreen.route,
                arguments: student,
              );
            },
            icon: const Icon(Icons.edit),
          ),
          Consumer<DatabaseProvider>(
            builder: (context, provider, child) {
              return IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi'),
                          content: const Text(
                              'Apakah anda yakin ingin menghapus data siswa ini?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  provider.deleteStudent(student.studentId!);
                                  Navigator.popUntil(
                                    context,
                                    (route) =>
                                        HomeScreen.route == route.settings.name,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Data berhasil dihapus')),
                                  );
                                },
                                child: const Text('Ya')),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Tidak',
                                    style: TextStyle(color: Colors.red))),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete),
              );
            },
          ),
        ],
      ),
      body: StudentDetail(student: student),
    );
  }
}
