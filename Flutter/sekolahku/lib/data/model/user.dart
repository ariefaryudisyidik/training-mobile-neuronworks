class User {
  late int? userId;
  late String username;
  late String password;

  User({
    this.userId,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'password': password,
    };
  }

  User.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    username = map['username'];
    password = map['password'];
  }
}
