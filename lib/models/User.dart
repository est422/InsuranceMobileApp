class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['Phone'],
      email: json['Email'],
    );
  }
}
