import 'dart:convert';

import 'package:booking/config.dart';
import 'package:booking/model/Login/login_request_model.dart';
import 'package:booking/model/Login/login_response_model.dart';
import 'package:booking/model/Register/register_request_model.dart';
import 'package:booking/model/Register/register_response_model.dart';
import 'package:booking/model/ValidacijaUsera/validacija_request_model.dart';
import 'package:booking/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../model/ProfilUser/profil_response_model.dart';
import '../model/ValidacijaUsera/validacija_response_model.dart';

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

  static Future<bool> slanjeValidacije(
    Validacija model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(
        'https://dev-api.lolbooking.com/api/v1/identity/upgrade-account');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      print('proslo ono novo');
      return true;
    } else {
      print('nije proslo');
      return false;
    }
  }

  static Future<String> saljiValidaciju(Validacija model) async {
    var loginDetails = await SharedService.loginDetails();
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
    return response.body;
  }

  static Future<String> validacija(validacijaResponseModel model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(
        "https://dev-api.lolbooking.com/api/v1/identity/upgrade-request");

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    print("eto gaaa ");
    return response.body;
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
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
      print("moze sad");
      return "proslo";
    }
  }
}
