import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:booking/domain/GetUser.dart';

import 'package:booking/model/Login/login_response_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/ProfilUser/profil_response_model.dart';
import '../model/ValidacijaUsera/validacija_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");
    print(isKeyExist);
    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return loginResponseJson(cacheData.syncData);
    }

    return null;
  }

  static Future<ProfilModel?> userDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return profilModel(cacheData.syncData);
    }

    return null;
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

  static Future<void> setUserDetails(
    ProfilModel profilResponse,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(profilResponse.toJson()),
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
