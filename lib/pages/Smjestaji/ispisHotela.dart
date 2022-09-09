import 'package:booking/pages/Smjestaji/detail_screen.dart';
import 'package:flutter/material.dart';

class ispisHotela extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String lokacija;

  ispisHotela(this.id, this.title, this.imageUrl, this.price, this.lokacija);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      DetailScreen.routeName,
                      arguments: id,
                    );
                  },
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_city_sharp,
                    color: Colors.grey,
                  ),
                  Text(
                    lokacija,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.money_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    price.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Text(
                    ' KM',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
