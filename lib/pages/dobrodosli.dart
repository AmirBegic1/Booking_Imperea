import 'package:booking/pages/home.dart';

import 'package:booking/pages/login_bottom_sheet/login_bottom.dart';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {}

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "BOOKING",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GlavnaStranica(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  "Dobrodošli",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "na LolBooking servis",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Prijavi se sa Google",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Prijavi se sa Facebook",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  color: const Color.fromARGB(255, 211, 234, 245),
                  onPressed: () => showModalBottomSheet(
                      enableDrag: true,
                      isDismissible: true,
                      context: context,
                      builder: (_) => LoginSheet()),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Nastavi na prijavu ->",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const Text(
                    "Registruj se ->",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
