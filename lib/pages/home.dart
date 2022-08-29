import 'package:booking/pages/NavBar.dart';
import 'package:booking/pages/atrakcije.dart';
import 'package:booking/pages/kartice.dart';
import 'package:booking/pages/smjestaji.dart';
import 'package:flutter/material.dart';

class GlavnaStranica extends StatefulWidget {
  const GlavnaStranica({Key? key}) : super(key: key);

  @override
  State<GlavnaStranica> createState() => _GlavnaStranicaState();
}

class _GlavnaStranicaState extends State<GlavnaStranica>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        drawer: NavBar(),
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
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  tabs: [Tab(text: "Smještaji"), Tab(text: "Atrakcije")],
                ),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  //mora posebni pagovi bit.! jooj
                  SmjestajScreen(),
                  AtrakcijeScreen(),
                ]),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Color(0xFFB7B7B7),
            selectedItemColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: ("Profil"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: ("Poruke"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_home_sharp),
                label: ("Dodaj"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                label: ("Rezervacije"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_rounded),
                label: ("Obavijesti"),
              ),
            ]));
  }
}
