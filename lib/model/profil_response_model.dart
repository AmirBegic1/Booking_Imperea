import 'dart:convert';

ProfilModel profilModel(String str) => ProfilModel.fromJson(json.decode(str));

class ProfilModel {
  ProfilModel({
    required this.success,
    required this.errorCode,
    required this.requestResult,
    required this.payload,
  });
  late final bool success;
  late final String errorCode;
  late final RequestResult requestResult;
  late final Payload payload;

  ProfilModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    requestResult = RequestResult.fromJson(json['requestResult']);
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['errorCode'] = errorCode;
    _data['requestResult'] = requestResult.toJson();
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class RequestResult {
  RequestResult({
    required this.totalResults,
    required this.totalResultsByFilter,
  });
  late final int totalResults;
  late final int totalResultsByFilter;

  RequestResult.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    totalResultsByFilter = json['totalResultsByFilter'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalResults'] = totalResults;
    _data['totalResultsByFilter'] = totalResultsByFilter;
    return _data;
  }
}

class Payload {
  Payload({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    required this.tenantId,
    required this.isBlocked,
    required this.isBusinessUser,
    required this.language,
    required this.userRoles,
  });
  late final String id;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String birthDate;
  late final String gender;
  late final String tenantId;
  late final bool isBlocked;
  late final bool isBusinessUser;
  late final String language;
  late final List<String> userRoles;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    tenantId = json['tenantId'];
    isBlocked = json['isBlocked'];
    isBusinessUser = json['isBusinessUser'];
    language = json['language'];
    userRoles = List.castFrom<dynamic, String>(json['userRoles']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['birthDate'] = birthDate;
    _data['gender'] = gender;
    _data['tenantId'] = tenantId;
    _data['isBlocked'] = isBlocked;
    _data['isBusinessUser'] = isBusinessUser;
    _data['language'] = language;
    _data['userRoles'] = userRoles;
    return _data;
  }
}
