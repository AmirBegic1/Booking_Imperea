import 'package:booking/domain/GetUser.dart';
import 'package:booking/model/ProfilUser/profil_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/user.dart';
import '../model/Login/login_response_model.dart';

class UserPreferences {
  Future<bool> saveUser(LoginResponseModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', user.payload!.token.toString());

    return prefs.commit();
  }

  Future<ProfilModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    return ProfilModel();
  }
}
