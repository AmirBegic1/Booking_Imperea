import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.success,
    required this.errorCode,
    required this.requestResult,
    required this.payload,
  });
  late final bool success;
  late final String errorCode;
  late final RequestResult requestResult;
  late final Payload payload;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.redirectToUrl,
  });
  late final String redirectToUrl;

  Payload.fromJson(Map<String, dynamic> json) {
    redirectToUrl = json['redirectToUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['redirectToUrl'] = redirectToUrl;
    return _data;
  }
}
