import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.payload,
    required this.success,
    this.errorCode,
    this.requestResult,
  });
  late final Payload payload;
  late final bool success;
  late final Null errorCode;
  late final Null requestResult;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    payload = Payload.fromJson(json['payload']);
    success = json['success'];
    errorCode = null;
    requestResult = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['payload'] = payload.toJson();
    _data['success'] = success;
    _data['errorCode'] = errorCode;
    _data['requestResult'] = requestResult;
    return _data;
  }
}

class Payload {
  Payload({
    required this.token,
  });
  late final String token;

  Payload.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    return _data;
  }
}
