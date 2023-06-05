// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sekolahku/data/model/student.dart';
import 'package:sekolahku/ui/components/form_add_edit_student.dart';

class FormScreen extends StatelessWidget {
  static const route = '/formScreen';
  final Student? student;
  const FormScreen({super.key, this.student});

  @override
  Widget build(BuildContext context) {
    return FormAddEditStudent(student: student);
  }
}
