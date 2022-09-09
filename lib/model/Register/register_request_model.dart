class RegisterRequestModel {
  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    required this.language,
    required this.phoneNumber,
    required this.isBusinessUser,
  });
  late final String email;
  late final String password;
  late final String firstName;
  late final String lastName;
  late final String roleId;
  late final String language;
  late final String phoneNumber;
  late final bool isBusinessUser;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    roleId = json['roleId'];
    language = json['language'];
    phoneNumber = json['phoneNumber'];
    isBusinessUser = json['isBusinessUser'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['roleId'] = roleId;
    _data['language'] = language;
    _data['phoneNumber'] = phoneNumber;
    _data['isBusinessUser'] = isBusinessUser;
    return _data;
  }
}
