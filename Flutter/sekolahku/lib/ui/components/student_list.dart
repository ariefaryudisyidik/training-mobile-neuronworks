import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sekolahku/data/local/database/database_provider.dart';
import 'package:sekolahku/data/model/student.dart';
import 'package:sekolahku/ui/screens/detail_screen.dart';
import 'package:sekolahku/utils/state_enum.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      final List<Student> studentList = provider.students;
      if (provider.studentState == RequestState.Loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (provider.studentState == RequestState.Empty) {
        return const Center(child: Text('Tidak ada data'));
      } else {
        return ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            final Student student = studentList[index];
            return InkWell(
              onTap: () async {
                final navigator = Navigator.of(context);
                final selectedStudent =
                    await provider.getStudentById(student.studentId!);
                navigator.pushNamed(DetailScreen.route,
                    arguments: selectedStudent);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(height: 64, width: 16),
                      CircleAvatar(
                        backgroundImage: AssetImage(student.photo),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${student.firstName} ${student.lastName}'),
                              const SizedBox(height: 4),
                              Text(
                                student.gender,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 0,
                          child: Column(
                            children: [
                              Text(student.degree),
                              const SizedBox(height: 8),
                              Text(student.phoneNumber),
                            ],
                          )),
                      const SizedBox(height: 64, width: 16),
                    ],
                  ),
                  const Divider()
                ],
              ),
            );
          },
        );
      }
    });
  }
}
