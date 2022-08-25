import 'package:booking/pages/dobrodosli.dart';
import 'package:booking/pages/home.dart';
import 'package:booking/pages/login.dart';
import 'package:booking/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlavnaStranica(),
    );
  }
}
