import 'package:booking/pages/Smjestaji/hoteli_grid.dart';
import 'package:flutter/material.dart';

class SmjestajScreen extends StatefulWidget {
  SmjestajScreen({Key? key}) : super(key: key);

  @override
  State<SmjestajScreen> createState() => _SmjestajScreenState();
}

class _SmjestajScreenState extends State<SmjestajScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              const TextField(
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
              const SizedBox(
                height: 18,
              ),
              const TextField(
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
              const SizedBox(
                height: 18,
              ),
              const TextField(
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: ElevatedButton(
                    child: const Text("Traži", style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 180, 214, 242)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      )),
                    ),
                    onPressed: () => null),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 150),
                // ignore: unnecessary_const
                child: const Text(
                  "Preporučeni smještaji",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              //ovdje ubacit gridove
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: HoteliGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
