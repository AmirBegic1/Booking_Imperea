import 'package:booking/pages/NavBar.dart';
import 'package:booking/pages/kartice.dart';
import 'package:flutter/material.dart';

class GlavnaStranica extends StatefulWidget {
  const GlavnaStranica({Key? key}) : super(key: key);

  @override
  State<GlavnaStranica> createState() => _GlavnaStranicaState();
}

class _GlavnaStranicaState extends State<GlavnaStranica> {
  List<String> urls = [
    "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
    "https://lh3.googleusercontent.com/proxy/wTkD1USQGpbVXzZFNLCZBDCL1OQS1bFzSgPa44cHwiheaY9DpoqMdNjBgEJcCIZSQeSkCO-2q5gfuhtnuz4cDhtpansOcWos093YsGvogdQqWnpWlA",
    "https://images.squarespace-cdn.com/content/v1/57d5245815d5db80eadeef3b/1558864684068-1CX3SZ0SFYZA1DFJSCYD/ke17ZwdGBToddI8pDm48kIpXjvpiLxnd0TWe793Q1fcUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcZwk0euuUA52dtKj-h3u7rSTnusqQy-ueHttlzqk_avnQ5Fuy2HU38XIezBtUAeHK/Marataba+Safari+lodge",
    "https://lh3.googleusercontent.com/proxy/ovCSxeucYYoir_rZdSYq8FfCHPeot49lbYqlk7nXs7sXjqAfbZ2uw_1E9iivLT85LwIZiGSnXuqkdbQ_xKFhd91M7Y05G94d",
    "https://q-xx.bstatic.com/xdata/images/hotel/max500/216968639.jpg?k=a65c7ca7141416ffec244cbc1175bf3bae188d1b4919d5fb294fab5ec8ee2fd2&o=",
    "https://hubinstitute.com/sites/default/files/styles/1200x500_crop/public/2018-06/photo-1439130490301-25e322d88054.jpeg?h=f720410d&itok=HI5-oD_g",
    "https://cdn.contexttravel.com/image/upload/c_fill,q_60,w_2600/v1549318570/production/city/hero_image_2_1549318566.jpg",
    "https://www.shieldsgazette.com/images-i.jpimedia.uk/imagefetch/https://jpgreatcontent.co.uk/wp-content/uploads/2020/04/spain.jpg",
    "https://www.telegraph.co.uk/content/dam/Travel/2017/November/tunisia-sidi-bou-GettyImages-575664325.jpg",
    "https://lp-cms-production.imgix.net/features/2018/06/byrsa-hill-carthage-tunis-tunisia-2d96efe7b9bf.jpg"
  ];
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Center(
                    child: Text(
                      "    Smještaji",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "     Atrakcije",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.zero,
                shadowColor: Color(0x55434343),
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: 'Traži destinaciju',
                    hintText: "Sarajevo..",
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.zero,
                shadowColor: Color(0x55434343),
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: 'Odaberi datum',
                    hintText: "18 Apr - 20 Apr",
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.zero,
                shadowColor: Color(0x55434343),
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    labelText: 'Broj osoba',
                    hintText: "",
                    prefixIcon: Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              DefaultTabController(
                length: 3,
                child: Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.blue,
                        unselectedLabelColor: Color(0xFF555555),
                        labelColor: Colors.blue,
                        labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        tabs: [
                          Tab(
                            text: "Preporučeni smještaji",
                          ),
                          Tab(
                            text: "Promocije",
                          ),
                          Tab(
                            text: "Favoriti",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 300.0,
                        child: TabBarView(
                          children: [
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Hoteli(urls[0], "Hotel Kont Residence",
                                      "Sarajevo", 4),
                                  Hoteli(
                                      urls[5], "ME Apartment", "Sarajevo", 4),
                                  Hoteli(
                                      urls[2], "Apartmani Seyda", "Zenica", 5),
                                  Hoteli(urls[5], "Hostel Franz Ferdi",
                                      "Zenica", 2),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Hoteli(urls[6], "Visit Rome", "Italy", 4),
                                  Hoteli(urls[8], "Visit Sidi bou Said",
                                      "Tunsia", 4),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Color(0xFFB7B7B7),
            selectedItemColor: Color(0xFFFE8C68),
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
