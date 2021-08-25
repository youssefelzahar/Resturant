class RecomModel {
  String imageUrl;
  String name;

  int price;
  RecomModel({
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

final List<RecomModel> recolist = [
  RecomModel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'pizza',
    price: 175,
  ),
  RecomModel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'burger',
    price: 300,
  ),
  RecomModel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'meat',
    price: 240,
  ),
];
