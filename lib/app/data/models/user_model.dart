class NameSearchModel {
  String name = '';
  String phone = '';
  String? id;

  NameSearchModel({required this.name, required this.phone, this.id});

  NameSearchModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    phone = json['phone'] ?? "";
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['id'] = id;
    return data;
  }
}
