import 'dart:convert';

import 'package:booking/model/ProfilUser/profil_response_model.dart';
import 'package:flutter/cupertino.dart';

class Korisnik with ChangeNotifier {
  List<ProfilModel> _korisnik = [];

  List<ProfilModel> get korisnik {
    return _korisnik;
  }
}
