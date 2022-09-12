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
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    data['success'] = success;
    data['errorCode'] = errorCode;
    data['requestResult'] = requestResult;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}
