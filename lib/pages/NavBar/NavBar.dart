import 'dart:io';

import 'package:booking/pages/home.dart';

import 'package:booking/services/shared_service.dart';

import 'package:flutter/material.dart';

import '../../services/api_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
              title: const Text("home"),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const GlavnaStranica()))),
            ),
            const Divider(),
            ListTile(
                title: const Text(
                  'Odjavi se',
                  style: TextStyle(color: Colors.blue),
                ),
                leading: const Icon(Icons.exit_to_app),
                onTap: () => SharedService.logout(context)),
            const Divider(),
            ListTile(
              title: const Text(
                'Login',
                style: TextStyle(color: Colors.blue),
              ),
              leading: const Icon(Icons.exit_to_app),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const GlavnaStranica()))),
            ),
            const Divider(),
            ListTile(
                title: const Text(
                  'Jel logiran',
                  style: const TextStyle(color: Colors.blue),
                ),
                leading: const Icon(Icons.exit_to_app),
                onTap: () => SharedService.isLoggedIn()),
            const Divider(),
            ListTile(
              title: const Text('Exit',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: const Icon(Icons.exit_to_app),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
    );
  }
}
