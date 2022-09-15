import 'package:booking/model/ProfilUser/profil_response_model.dart';
import 'package:booking/pages/Smjestaji/ispisHotela.dart';
import 'package:booking/provider/hoteli.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoteliGrid extends StatelessWidget {
  const HoteliGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hoteliData = Provider.of<Hoteli>(context);
    final profil = Provider.of<ProfilModel>(context);
    final lista = hoteliData.hoteli;
    final korisnik = profil.payload;

    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: lista.length,
      itemBuilder: ((ctx, i) => ispisHotela(lista[i].id, lista[i].title,
          lista[i].imageUrl, lista[i].price, lista[i].lokacija)),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
    );
  }
}
