import 'dart:convert';

validacijaResponseModel validacijaModelFromJson(String str) =>
    validacijaResponseModel.fromJson(json.decode(str));

class validacijaResponseModel {
  bool? isApproved;

  validacijaResponseModel({this.isApproved});

  validacijaResponseModel.fromJson(Map<String, dynamic> json) {
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isApproved'] = isApproved;
    return data;
  }
}
