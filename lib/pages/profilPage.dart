import 'package:booking/model/ProfilUser/profil_response_model.dart';
import 'package:booking/services/shared_service.dart';

import 'package:flutter/material.dart';

import '../model/Login/login_response_model.dart';
import '../services/api_service.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<ProfilModel>(
            future: APIService.getUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outlined),
                      title: const Text("Ime"),
                      subtitle:
                          Text(snapshot.data!.payload!.firstName.toString()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_outlined),
                      title: const Text("Prezime"),
                      subtitle:
                          Text(snapshot.data!.payload!.lastName.toString()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text("Vaš email"),
                      subtitle: Text(snapshot.data!.payload!.email.toString()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.date_range),
                      title: const Text("Datum rodjenja"),
                      subtitle:
                          Text(snapshot.data!.payload!.birthDate.toString()),
                    ),
                    ListTile(
                      subtitle: Text(
                        snapshot.data!.payload!.userRoles.toString(),
                      ),
                      leading: const Icon(Icons.business_sharp),
                      title: const Text("Vrsta profila"),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Scaffold(
                  body: Text("Korsnik se nije prijavio"),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
