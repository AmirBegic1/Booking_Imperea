import 'dart:convert';

import 'dart:io';
import 'package:booking/model/ProfilUser/profil_response_model.dart';
import 'package:booking/pages/dobrodosli.dart';

import 'package:booking/pages/Dodavanje%20Hotela/validacija_dodavanja.dart';
import 'package:booking/services/shared_service.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../model/Login/login_request_model.dart';
import '../../services/api_service.dart';

class NavBar2 extends StatefulWidget {
  const NavBar2({Key? key}) : super(key: key);

  @override
  State<NavBar2> createState() => _NavBarState2();
}

Future<String> getUserProfile() async {
  dynamic userRes;
  userRes = await APIService.getUserProfile();
  return userRes;
}

class _NavBarState2 extends State<NavBar2> {
  @override
  void initState() {
    super.initState();
    APIService.getUserProfile();
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
            Divider(),
            ListTile(
                title: Text('Logiraj se'),
                leading: Icon(Icons.exit_to_app),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => WelcomeScreen())))),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
    );
  }
}
