import 'package:booking/pages/Smjestaji/result.dart';
import 'package:booking/provider/hoteli.dart';
import 'package:booking/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:snippet_coder_utils/FormHelper.dart';

import '../../config.dart';

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
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    SharedService.isLoggedIn();
  }

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
          style: TextStyle(
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
                          style: TextStyle(
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
                          style: TextStyle(
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
                          "/NO??",
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Ispunjavate uvjete za popust u objektu Hotel Koncept Residence! Za ovu u??tedu samo se trebate prijaviti. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Hotel Koncept Residence nalazi se u Sarajevu, na 6 km od Sarajevskog ratnog tunela, te nudi restoran, besplatno privatno parkirali??te, bar i zajedni??ki salon. U objektu su dostupne obiteljske sobe i terasa. Recepcija je otvorena 24 sata, a tako??er su dostupne posluga u sobu i mjenja??nica. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Klimatizirane hotelske sobe sadr??e radni stol, elektri??no kuhalo za vodu, hladnjak, sef, TV ravnog ekrana i vlastitu kupaonicu s bideom. Pojedine sobe uklju??uju kuhinju s pe??nicom i plo??om za kuhanje. U svim sobama hotela Koncept Residence dostupni su posteljina i ru??nici.",
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
                                                  Icons.wifi,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Free WiFi",
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
                                                  Icons.app_blocking_outlined,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Minibar",
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
                                                  Icons.holiday_village,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Dvori??te",
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
                                                  Icons.local_parking,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Besplatan parking",
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
                                                  Icons.child_care,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Igrali??te za djecu",
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
                                                  Icons.balcony,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Terasa",
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
                                                  Icons.gamepad,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Xbox",
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
                                                  Icons.ac_unit,
                                                  color: Colors.grey,
                                                ),
                                                const Text(
                                                  "  Klima",
                                                  style: TextStyle(
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
                              "           102 KM x 3 no??enja                         ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Text(
                              "306 KM",
                              style: TextStyle(
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
                              "Rezervi??i",
                              () {
                                APIService.provjeraValidacije().then(
                                  (response) {
                                    setState(() {
                                      isAPIcallProcess = false;
                                    });
                                    if (response) {
                                      print("opaaaa");
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                          context,
                                          Config.appName,
                                          "Profil vam jo?? nije potvr??en od strane admina",
                                          "OK", () {
                                        showModalBottomSheet(
                                            enableDrag: true,
                                            isDismissible: true,
                                            context: context,
                                            builder: (_) =>
                                                ZahjtevRezervacije());
                                      });
                                    }
                                  },
                                );
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
