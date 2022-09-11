import 'dart:convert';

import 'dart:io';
import 'package:booking/model/ProfilUser/profil_response_model.dart';
import 'package:booking/pages/dobrodosli.dart';

import 'package:booking/pages/home.dart';

import 'package:booking/pages/Dodavanje%20Hotela/validacija_dodavanja.dart';
import 'package:booking/services/shared_service.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/Login/login_request_model.dart';
import '../../services/api_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

Future<String> getUserProfile() async {
  dynamic userRes;
  userRes = await APIService.getUserProfile();
  return userRes;
}

class _NavBarState extends State<NavBar> {
  late Future<ProfilModel> dajUsera;
  APIService api = APIService();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                "BOOKING",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => GlavnaStranica()))),
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Odjavi se',
                  style: TextStyle(color: Colors.blue),
                ),
                leading: Icon(Icons.exit_to_app),
                onTap: () => SharedService.logout(context)),
            Divider(),
            ListTile(
              title:
                  Text('Exit', style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Icon(Icons.exit_to_app),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
    );
  }
}
