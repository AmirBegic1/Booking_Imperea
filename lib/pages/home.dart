import 'package:booking/pages/NavBar/NavBar.dart';

import 'package:booking/pages/profilPage.dart';
import 'package:booking/pages/notifications.dart';
import 'package:booking/pages/reservations.dart';

import 'package:booking/pages/Dodavanje%20Hotela/validacija_dodavanja.dart';

import 'package:flutter/material.dart';

import 'main_home.dart';

class GlavnaStranica extends StatefulWidget {
  const GlavnaStranica({Key? key}) : super(key: key);

  @override
  State<GlavnaStranica> createState() => _GlavnaStranicaState();
}

class _GlavnaStranicaState extends State<GlavnaStranica>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  final screens = [
    MainHome(),
    Messages(),
    ValidacijaPage(),
    Reservations(),
    Nofitications(),
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const Text(
            "BOOKING",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
          currentIndex: currentIndex,
          unselectedItemColor: Color(0xFFB7B7B7),
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: ("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: ("Profil"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_home_sharp),
              label: ("Dodaj"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: ("Rezervacije"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_rounded),
              label: ("Obavijesti"),
            ),
          ],
        ));
  }
}
