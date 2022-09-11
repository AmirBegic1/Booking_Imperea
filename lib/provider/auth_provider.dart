import 'dart:async';
import 'dart:convert';

import 'package:booking/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/Login/login_response_model.dart';

enum Status { NotLoggedIn, LoggedIn, Authenticationg, LoggedOut }

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if (response.statusCode == 200) {
      var userData = responseData['date'];

//kreiranje user modela (novog)!
      LoginResponseModel authUser = LoginResponseModel.fromJson(responseData);

      //idemo kreirat shared preferences

    }
  }
}
