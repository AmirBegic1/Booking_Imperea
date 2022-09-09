import 'package:booking/pages/atrakcije.dart';
import 'package:booking/pages/smjestaji.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
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
    );
  }
}
