class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String? email;
  final String? device;
  final String? model;
  final String? createdAt;
  final int? handsetCost;
  final String? handsetId;
  final int? iMEI1;
  final int? iMEI2;
  final String? serialNo;
  final String? platform;
  final String? hardWare;
  final int? enteredAmount;
  final String? selectedPlan;
  final String? imageUrl;

  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.device,
      required this.model,
      required this.createdAt,
      required this.handsetCost,
      required this.handsetId,
      required this.iMEI1,
      required this.iMEI2,
      required this.serialNo,
      required this.platform,
      required this.hardWare,
      required this.enteredAmount,
      required this.selectedPlan,
      required this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      phone: json['Phone'],
      email: json['Email'],
      device: json['Device'],
      model: json['Model'],
      createdAt: json['CreatedAt'],
      handsetCost: json['HandsetCost'],
      handsetId: json['HandsetId'],
      iMEI1: json['IMEI1'],
      iMEI2: json['IMEI2'],
      serialNo: json['SerialNo'],
      platform: json['Platform'],
      hardWare: json['HardWare'],
      enteredAmount: json['EnteredAmount'],
      selectedPlan: json['SelectedPlan'],
      imageUrl: json['ImageUrl'],
    );
  }
}
