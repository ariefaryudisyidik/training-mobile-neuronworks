import 'package:flutter/material.dart';
import 'package:sekolahku/data/model/student.dart';

class StudentDetail extends StatelessWidget {
  final Student student;
  const StudentDetail({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage(student.photo),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: Text('${student.firstName} ${student.lastName}'),
            subtitle: const Text('Nama'),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(student.phoneNumber),
            subtitle: const Text('No. Hp'),
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: Text(student.gender),
            subtitle: const Text('Jenis Kelamin'),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: Text(student.degree),
            subtitle: const Text('Jenjang'),
          ),
          ListTile(
            leading: const Icon(Icons.location_pin),
            title: Text(student.address),
            subtitle: const Text('Alamat'),
          ),
        ],
      ),
    );
  }
}
