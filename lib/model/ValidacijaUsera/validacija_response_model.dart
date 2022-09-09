// ignore_for_file: camel_case_types

import 'dart:convert';

validacijaResponseModel validacijaModelFromJson(String str) =>
    validacijaResponseModel.fromJson(json.decode(str));

String loginModelToJson(validacijaResponseModel data) =>
    json.encode(data.toJson());

class validacijaResponseModel {
  validacijaResponseModel({
    required this.success,
    required this.errorCode,
    required this.requestResult,
    required this.payload,
  });

  bool success;
  String errorCode;
  RequestResult requestResult;
  List<Payload> payload;

  factory validacijaResponseModel.fromJson(Map<String, dynamic> json) =>
      validacijaResponseModel(
        success: json["success"],
        errorCode: json["errorCode"],
        requestResult: RequestResult.fromJson(json["requestResult"]),
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errorCode": errorCode,
        "requestResult": requestResult.toJson(),
        "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
      };
}

class Payload {
  Payload({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.jib,
    required this.fullName,
    required this.email,
    required this.isApproved,
  });

  int id;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDeleted;
  String jib;
  String fullName;
  String email;
  bool isApproved;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        jib: json["jib"],
        fullName: json["fullName"],
        email: json["email"],
        isApproved: json["isApproved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "jib": jib,
        "fullName": fullName,
        "email": email,
        "isApproved": isApproved,
      };
}

class RequestResult {
  RequestResult({
    required this.totalResults,
    required this.totalResultsByFilter,
  });

  int totalResults;
  int totalResultsByFilter;

  factory RequestResult.fromJson(Map<String, dynamic> json) => RequestResult(
        totalResults: json["totalResults"],
        totalResultsByFilter: json["totalResultsByFilter"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "totalResultsByFilter": totalResultsByFilter,
      };
}
