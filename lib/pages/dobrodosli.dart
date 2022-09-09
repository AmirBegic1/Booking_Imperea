import 'package:booking/pages/home.dart';

import 'package:booking/pages/login_bottom_sheet/login_bottom.dart';
import 'package:booking/pages/Dodavanje%20Hotela/validacija_dodavanja.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        title: Text(
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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GlavnaStranica(),
                ));
          },
          icon: Icon(
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Dobrodošli",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "na LolBooking servis",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 17),
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
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Prijavi se sa Google",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
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
                  color: Color.fromARGB(255, 211, 234, 245),
                  onPressed: () => showModalBottomSheet(
                      enableDrag: true,
                      isDismissible: true,
                      context: context,
                      builder: (_) => LoginSheet()),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Nastavi na prijavu ->",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Text(
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
