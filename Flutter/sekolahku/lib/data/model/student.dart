class Student {
  late int? studentId;
  late String phoneNumber;
  late String firstName;
  late String lastName;
  late String gender;
  late String degree;
  late String photo;
  late String address;
  late List<String> hobbies;

  Student({
    this.studentId,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.degree,
    required this.photo,
    required this.address,
    required this.hobbies,
  });

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'degree': degree,
      'photo': photo,
      'address': address,
      'hobbies': hobbies.join(','),
    };
  }

  Student.fromMap(Map<String, dynamic> map) {
    studentId = map['studentId'];
    phoneNumber = map['phoneNumber'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    gender = map['gender'];
    degree = map['degree'];
    photo = map['photo'];
    address = map['address'];
    hobbies = map['hobbies'].toString().split(',');
  }
}
