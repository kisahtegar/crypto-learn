class Coin {
  final String name;
  final String symbol;
  final String urlImage;
  final num price;
  final num changeInPercentage;

  const Coin({
    required this.name,
    required this.symbol,
    required this.urlImage,
    required this.price,
    required this.changeInPercentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      urlImage: json['image'],
      price: json['current_price'],
      changeInPercentage: json['price_change_percentage_24h'],
    );
  }

  // static Coin fromJson(json) => Coin(
  //       name: json['name'],
  //       symbol: json['symbol'],
  //       urlImage: json['image'],
  //       price: json['current_price'],
  //       changeInPercentage: json['price_change_percentage_24h'],
  //     );
}
