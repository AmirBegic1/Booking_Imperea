import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:booking/model/Login/login_request_model.dart';
import 'package:booking/model/Login/login_response_model.dart';
import 'package:booking/model/ProfilUser/profil_response_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../model/ValidacijaUsera/validacija_response_model.dart';
import '../pages/dobrodosli.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return loginResponseJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(
    LoginResponseModel loginResponse,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(loginResponse.toJson()),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> setValidacijaDetails(
    validacijaResponseModel validacijaResponse,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(validacijaResponse.toJson()),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/dobrodosli',
      (route) => false,
    );
  }
}
