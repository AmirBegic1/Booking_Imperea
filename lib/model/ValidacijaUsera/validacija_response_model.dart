// ignore_for_file: camel_case_types

import 'dart:convert';

validacijaResponseModel validacijaModelFromJson(String str) =>
    validacijaResponseModel.fromJson(json.decode(str));

String loginModelToJson(validacijaResponseModel data) =>
    json.encode(data.toJson());

class validacijaResponseModel {
  bool? isApproved;

  validacijaResponseModel({this.isApproved});

  validacijaResponseModel.fromJson(Map<String, dynamic> json) {
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isApproved'] = this.isApproved;
    return data;
  }
}
