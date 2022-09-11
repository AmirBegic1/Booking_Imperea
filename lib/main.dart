import 'package:booking/pages/Smjestaji/detail_screen.dart';

import 'package:booking/pages/dobrodosli.dart';
import 'package:booking/pages/home.dart';

import 'package:booking/pages/proces_verifikacije.dart';
import 'package:booking/provider/hoteli.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/NavBar/NavBar.dart';

Widget _navbar1 = const NavBar();

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Hoteli(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const GlavnaStranica(),
          '/home': (context) => const GlavnaStranica(),
          '/dobrodosli': (context) => WelcomeScreen(),
          '/proces_verifikaije': (context) => const ProcesVerifikacije(),
          DetailScreen.routeName: (context) => DetailScreen(),
        },
      ),
    );
  }
}
