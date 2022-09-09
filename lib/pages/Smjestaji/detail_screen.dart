import 'package:booking/provider/hoteli.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../config.dart';
import '../../model/ValidacijaUsera/validacija_request_model.dart';
import '../../services/api_service.dart';

class DetailScreen extends StatefulWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final String lokacija;
  // final double price;

  // DetailScreen(this.id, this.title, this.imageUrl, this.lokacija, this.price);
  static const routeName = '/DetailScreen';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? jib;

  String? userId;
  String? createdAt;
  String? updatedAt;
  String? isDeleted;
  String? fullName;
  String? email;
  String? isApproved;

  @override
  Widget build(BuildContext context) {
    final hotelId = ModalRoute.of(context)?.settings.arguments as String;
    final lista = Provider.of<Hoteli>(context, listen: false).findById(hotelId);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
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
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(1.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      lista.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 7),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        const Text(
                          "Sarajevo, Prvomajska 19  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        const Text(
                          "3 Osobe  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.bed,
                          color: Colors.grey,
                        ),
                        const Text(
                          " 2",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[],
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(0)),
                        child: const Text(
                          "4.3 (256 reviews)",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Row(
                      children: [
                        const Text(
                          "119 KM    ",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20.0),
                        ),
                        Text(
                          lista.price.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "/NOĆ",
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                      foregroundDecoration:
                          const BoxDecoration(color: Colors.black26),
                      height: 400,
                      width: 900,
                      child: Image.asset(lista.imageUrl, fit: BoxFit.cover)),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 20.0, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Opis",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Ispunjavate uvjete za popust u objektu Hotel Koncept Residence! Za ovu uštedu samo se trebate prijaviti. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Hotel Koncept Residence nalazi se u Sarajevu, na 6 km od Sarajevskog ratnog tunela, te nudi restoran, besplatno privatno parkiralište, bar i zajednički salon. U objektu su dostupne obiteljske sobe i terasa. Recepcija je otvorena 24 sata, a također su dostupne posluga u sobu i mjenjačnica. ",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Klimatizirane hotelske sobe sadrže radni stol, električno kuhalo za vodu, hladnjak, sef, TV ravnog ekrana i vlastitu kupaonicu s bideom. Pojedine sobe uključuju kuhinju s pećnicom i pločom za kuhanje. U svim sobama hotela Koncept Residence dostupni su posteljina i ručnici.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 5, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.door_back_door,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  8 rooms",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.wifi,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Free WiFi",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.app_blocking_outlined,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Minibar",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.holiday_village,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Dvorište",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.local_parking,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Besplatan parking",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.child_care,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Igralište za djecu",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.games,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  PlayStation",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.balcony,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Terasa",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.gamepad,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Xbox",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.ac_unit,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Klima",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "Rezervacija",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Column(children: [
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
                        ]),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Text(
                              "           102 KM x 3 noćenja                         ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Text(
                              "306 KM",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "           TOTAL                                                ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "306 KM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170),
                          child: SizedBox(
                            width: double.infinity,
                            child: FormHelper.submitButton(
                              "Rezerviši",
                              () {
                                if (validateAndSave()) {
                                  setState(() {
                                    isAPIcallProcess = true;
                                  });

                                  Validacija model = Validacija(
                                    jib: jib!,
                                  );
                                  APIService.validacija(model).then(
                                    (response) {
                                      setState(() {
                                        isAPIcallProcess = false;
                                      });
                                      if (response.isEmpty) {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          '/home',
                                          (route) => false,
                                        );
                                      } else {
                                        FormHelper.showSimpleAlertDialog(
                                          context,
                                          Config.appName,
                                          "Profil vam još nije potvrđen od strane admina",
                                          "OK",
                                          () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              btnColor:
                                  const Color.fromARGB(255, 217, 229, 240),
                              borderColor: Colors.transparent,
                              txtColor: Colors.blue,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
