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
        ? new RequestResult.fromJson(json['requestResult'])
        : null;
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.requestResult != null) {
      data['requestResult'] = this.requestResult!.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalResults'] = this.totalResults;
    data['totalResultsByFilter'] = this.totalResultsByFilter;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['tenantId'] = this.tenantId;
    data['isBlocked'] = this.isBlocked;
    data['isBusinessUser'] = this.isBusinessUser;
    data['language'] = this.language;
    data['userRoles'] = this.userRoles;
    return data;
  }
}
