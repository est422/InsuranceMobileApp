class User {
  late String _id;
  late String _firstName;
  late String _lastName;
  late String _phone;
  late String _email;

  User(
      {required String id,
      required String firstName,
      required String lastName,
      required String phone,
      String? email}) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _email = email!;
  }

  // Properties
  // String get id => _id;
  // set id(String id) => _id = id;
  // String get firstName => _firstName;
  // set firstName(String firstName) => _firstName = firstName;
  // String get lastName => _lastName;
  // set lastName(String lastName) => _lastName = lastName;
  // String get phone => _phone;
  // set phone(String phone) => _phone = phone;
  // String get email => _email;
  // set email(String email) => _email = email;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phone = json['phone'];
    _email = json['email'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['phone'] = _phone;
    data['email'] = _email;
    return data;
  }
}
