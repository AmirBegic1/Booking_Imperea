class ListaHotela {
  final String id;
  final String title;

  final double price;
  final String imageUrl;
  final String lokacija;
  bool isFavorite;

  ListaHotela(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.lokacija,
      this.isFavorite = false});
}
