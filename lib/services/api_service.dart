import 'dart:convert';

import 'package:booking/config.dart';
import 'package:booking/model/login_request_model.dart';
import 'package:booking/model/login_response_model.dart';
import 'package:booking/model/register_request_model.dart';
import 'package:booking/model/register_response_model.dart';
import 'package:booking/model/validacija_request_model.dart';
import 'package:booking/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../model/profil_response_model.dart';
import '../model/validacija_response_model.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('https://dev-api.lolbooking.com/api/v1/identity/login');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url =
        Uri.parse("https://dev-api.lolbooking.com/api/v1/identity/register");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }

  static Future<ValidacijaResponseModel> validacija(
      ValidacijaRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(
        "https://dev-api.lolbooking.com/api/v1/identity/upgrade-account");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return validacijaResponseModel(response.body);
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.payload.token}'
    };

    var url =
        Uri.parse('https://dev-api.lolbooking.com/api/v1/identity/account');

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      print("dssdsddddd");
      return response.body;
    } else {
      return "";
    }
  }
}
