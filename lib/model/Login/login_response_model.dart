import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  Payload? payload;
  bool? success;
  Null? errorCode;
  Null? requestResult;

  LoginResponseModel({
    this.payload,
    this.success,
    this.errorCode,
    this.requestResult,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    success = json['success'];
    errorCode = json['errorCode'];
    requestResult = json['requestResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    data['requestResult'] = this.requestResult;
    return data;
  }
}

class Payload {
  String? token;

  Payload({this.token});

  Payload.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}