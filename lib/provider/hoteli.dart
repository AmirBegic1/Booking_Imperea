import 'package:flutter/cupertino.dart';

import 'listahotela.dart';

class Hoteli with ChangeNotifier {
  List<ListaHotela> _hoteli = [
    ListaHotela(
        id: 'p1',
        title: 'Hotel Kont Residence',
        price: 120,
        imageUrl: 'assets/kont.png',
        lokacija: 'Sarajevo'),
    ListaHotela(
        id: 'p2',
        title: 'EM Apartment',
        price: 120,
        imageUrl: 'assets/em.png',
        lokacija: 'Sarajevo'),
    ListaHotela(
        id: 'p3',
        title: 'Apartmani Seyda',
        price: 120,
        imageUrl: 'assets/seyda.png',
        lokacija: 'Zenica'),
    ListaHotela(
        id: 'p4',
        title: 'Promenade Inn',
        price: 120,
        imageUrl: 'assets/promenadex3.png',
        lokacija: 'Tuzla'),
  ];

  List<ListaHotela> get hoteli {
    return [..._hoteli];
  }

  ListaHotela findById(String id) {
    return _hoteli.firstWhere((prod) => prod.id == id);
  }

  void dodajHotel() {
    // _hoteli.add(value);
    notifyListeners();
  }
}
