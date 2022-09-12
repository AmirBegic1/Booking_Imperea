import 'dart:convert';

import 'package:booking/config.dart';
import 'package:booking/model/Login/login_request_model.dart';
import 'package:booking/model/Login/login_response_model.dart';

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
      print(response.body);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.payload?.token}'
    };

    var url =
        Uri.parse('https://dev-api.lolbooking.com/api/v1/identity/account');

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setUserDetails(
        profilModel(
          response.body,
        ),
      );
      print(response.body.toString());
      return true;
    } else {
      print(Error);
      return false;
    }
  }

  static Future<bool> slanjeValidacije(
    Validacija model,
  ) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.payload?.token}'
    };

    var url = Uri.parse(
        'https://dev-api.lolbooking.com/api/v1/identity/upgrade-account');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: json.encode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setValidacijaDetails(
        validacijaModelFromJson(
          response.body,
        ),
      );
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
      'Authorization': 'Bearer ${loginDetails?.payload?.token}'
    };

    var url = Uri.parse(
        "https://dev-api.lolbooking.com/api/v1/identity/upgrade-account");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return response.body;

    ///FALIIIIIIIIIIIII IF ! ONAJ DODAJ OD AKANTUA USERA!
    ///TO OBAVEZNOO!
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
    //FALII IFF OBAVEZNO IST GORE I RADICE!

    print("eto gaaa ");
    return response.body;
  }
}
