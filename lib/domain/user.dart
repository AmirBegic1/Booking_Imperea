class User {
  Payload? payload;
  bool? success;
  Null? errorCode;
  Null? requestResult;

  User({this.payload, this.success, this.errorCode, this.requestResult});

  User.fromJson(Map<String, dynamic> json) {
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    success = json['success'];
    errorCode = json['errorCode'];
    requestResult = json['requestResult'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
