import 'package:booking/pages/NavBar/NavBar.dart';
import 'package:booking/services/api_service.dart';
import 'package:flutter/material.dart';

class Nofitications extends StatefulWidget {
  const Nofitications({Key? key}) : super(key: key);

  @override
  State<Nofitications> createState() => _NofiticationsState();
}

class _NofiticationsState extends State<Nofitications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return Scaffold();
    // return FutureBuilder(
    //     future: APIService.getUserProfile(),
    //     builder: (BuildContext context, AsyncSnapshot<String> model) {
    //       if (model.hasData) {
    //         return Center(
    //           child: Text(model.data!),
    //         );
    //       } else {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //     });
  }
}
