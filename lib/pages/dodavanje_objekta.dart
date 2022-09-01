import 'package:booking/pages/home.dart';
import 'package:flutter/material.dart';

class DodavanjeObjekta extends StatefulWidget {
  const DodavanjeObjekta({Key? key}) : super(key: key);

  @override
  State<DodavanjeObjekta> createState() => _DodavanjeObjektaState();
}

class _DodavanjeObjektaState extends State<DodavanjeObjekta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => GlavnaStranica())));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
