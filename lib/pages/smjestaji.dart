import 'dart:convert';

import 'package:booking/pages/atrakcije/kont.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SmjestajScreen extends StatefulWidget {
  const SmjestajScreen({Key? key}) : super(key: key);

  @override
  State<SmjestajScreen> createState() => _SmjestajScreenState();
}

class _SmjestajScreenState extends State<SmjestajScreen> {
  List<String> urls = [
    'blob:https://xd.adobe.com/0994877a-fe4e-4f17-81c3-fa1dcacdbb43',
    'blob:https://xd.adobe.com/6a03cdde-99a4-4e4e-94f2-ef78322e63fe',
    'blob:https://xd.adobe.com/9b7a4d54-947d-4b48-afbe-66e9b0482c87',
    'blob:https://xd.adobe.com/30c6b4e8-ad54-48e3-9300-dbeda05bb8de',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Traži destinaciju",
                  hintText: "Sarajevo",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.place,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Odaberi datum",
                  hintText: "18 Apr - 20 Apr",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Broj osoba",
                  hintText: "Uradit ono",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: ElevatedButton(
                    child: Text("Traži", style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 180, 214, 242)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      )),
                    ),
                    onPressed: () => null),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text(
                  "Preporučeni smještaji",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/kontx3.png',
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 150, top: 10),
                      child: Text(
                        'Hotel Kont Residence',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 220, top: 10),
                      child: Text(
                        '120 KM ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 220, top: 5),
                      child: Text(
                        'Sarajevo ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          child: Text('Posjeti'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Kont()),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/em3.png',
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 190, top: 10),
                      child: Text(
                        'EM Aparment',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 220, top: 10),
                      child: Text(
                        '120 KM ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 220, top: 5),
                      child: Text(
                        'Sarajevo ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          child: Text('Posjeti'),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/seyda3.png',
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 160, top: 10),
                      child: Text(
                        'Apartmani Seyda',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 230, top: 10),
                      child: Text(
                        '120 KM ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 234, top: 5),
                      child: Text(
                        'Zenica ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          child: Text('Posjeti'),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/promenadex3.png',
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100, top: 10),
                      child: Text(
                        'Promenade Inn by ZETTA',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 240, top: 10),
                      child: Text(
                        '120 KM ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 255, top: 5),
                      child: Text(
                        'Tuzla ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          child: Text('Posjeti'),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
