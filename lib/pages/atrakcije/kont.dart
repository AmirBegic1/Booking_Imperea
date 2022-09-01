import 'package:flutter/material.dart';

class Kont extends StatefulWidget {
  Kont({Key? key}) : super(key: key);

  @override
  State<Kont> createState() => _KontState();
}

class _KontState extends State<Kont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Hotel Kont Residence",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 7),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Text(
                          "Sarajevo, Prvomajska 19  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        Text(
                          "3 Osobe  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.bed,
                          color: Colors.grey,
                        ),
                        Text(
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
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
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
                        child: Text(
                          "4.3 (256 reviews)",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "119 KM",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20.0),
                        ),
                        Text(
                          "   102 KM",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text(
                          "/NOĆ",
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                      foregroundDecoration:
                          BoxDecoration(color: Colors.black26),
                      height: 400,
                      width: 900,
                      child:
                          Image.asset("assets/kontx3.png", fit: BoxFit.cover)),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 20.0, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Opis",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Ispunjavate uvjete za popust u objektu Hotel Koncept Residence! Za ovu uštedu samo se trebate prijaviti. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Hotel Koncept Residence nalazi se u Sarajevu, na 6 km od Sarajevskog ratnog tunela, te nudi restoran, besplatno privatno parkiralište, bar i zajednički salon. U objektu su dostupne obiteljske sobe i terasa. Recepcija je otvorena 24 sata, a također su dostupne posluga u sobu i mjenjačnica. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
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
                                                Icon(
                                                  Icons.door_back_door,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.wifi,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.app_blocking_outlined,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.holiday_village,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "  Dvorište",
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
                                                Icon(
                                                  Icons.local_parking,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.child_care,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.games,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.balcony,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.gamepad,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                                                Icon(
                                                  Icons.ac_unit,
                                                  color: Colors.grey,
                                                ),
                                                Text(
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
                        Text(
                          "Rezervacija",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Column(children: [
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
                        ]),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            Text(
                              "           102 KM x 3 noćenja                         ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "306 KM",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "           TOTAL                                                ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "306 KM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Color.fromARGB(255, 229, 237, 243),
                              textColor: Colors.blue,
                              child: Text(
                                "Rezerviši",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0,
                              ),
                              onPressed: () {},
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
}
