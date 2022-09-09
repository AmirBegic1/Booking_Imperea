// To parse this JSON data, do
//
//     final validacija = validacijaFromJson(jsonString);

import 'dart:convert';

Validacija validacijaFromJson(String str) =>
    Validacija.fromJson(json.decode(str));

String validacijaToJson(Validacija data) => json.encode(data.toJson());

class Validacija {
  Validacija({
    required this.jib,
  });

  String jib;

  factory Validacija.fromJson(Map<String, dynamic> json) => Validacija(
        jib: json["jib"],
      );

  Map<String, dynamic> toJson() => {
        "jib": jib,
      };
}
