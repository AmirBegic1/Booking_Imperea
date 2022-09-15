class UserDetails {
  bool? success;
  String? errorCode;
  RequestResult? requestResult;
  Payload? payload;

  UserDetails({this.success, this.errorCode, this.requestResult, this.payload});

  UserDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    requestResult = json['requestResult'] != null
        ? RequestResult.fromJson(json['requestResult'])
        : null;
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['errorCode'] = errorCode;
    if (requestResult != null) {
      data['requestResult'] = requestResult!.toJson();
    }
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}

class RequestResult {
  int? totalResults;
  int? totalResultsByFilter;

  RequestResult({this.totalResults, this.totalResultsByFilter});

  RequestResult.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    totalResultsByFilter = json['totalResultsByFilter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalResults'] = totalResults;
    data['totalResultsByFilter'] = totalResultsByFilter;
    return data;
  }
}

class Payload {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? gender;
  String? tenantId;
  bool? isBlocked;
  bool? isBusinessUser;
  String? language;
  List<String>? userRoles;

  Payload(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.gender,
      this.tenantId,
      this.isBlocked,
      this.isBusinessUser,
      this.language,
      this.userRoles});

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
    userRoles = json['userRoles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['tenantId'] = tenantId;
    data['isBlocked'] = isBlocked;
    data['isBusinessUser'] = isBusinessUser;
    data['language'] = language;
    data['userRoles'] = userRoles;
    return data;
  }
}
