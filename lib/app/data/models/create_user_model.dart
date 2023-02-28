class CreateUserModel {
  String name = '';
  String email = '';
  String phone = '';
  String emergencyNumber = '';

  CreateUserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.emergencyNumber,
  });

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emergencyNumber = json['emergency_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['emergency_number'] = emergencyNumber;
    return data;
  }
}
