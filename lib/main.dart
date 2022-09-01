import 'package:booking/pages/dobrodosli.dart';
import 'package:booking/pages/home.dart';
import 'package:booking/pages/login.dart';
import 'package:booking/pages/proces_verifikacije.dart';
import 'package:booking/pages/validacija_dodavanja.dart';
import 'package:booking/pages/smjestaji.dart';
import 'package:booking/services/shared_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const GlavnaStranica(),
        '/home': (context) => const GlavnaStranica(),
        '/register': (context) => ValidacijaPage(),
        '/login': (context) => LoginPage(),
        '/dobrodosli': (context) => WelcomeScreen(),
        '/proces_verifikacije': (context) => ProcesVerifikacije(),
      },
    );
  }
}
