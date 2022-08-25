class CoinModel {
  final String name;
  final String symbol;
  final String urlImage;
  final num price;
  final num changeInPercentage;

  const CoinModel({
    required this.name,
    required this.symbol,
    required this.urlImage,
    required this.price,
    required this.changeInPercentage,
  });

  factory CoinModel.fromJson(json) {
    return CoinModel(
      name: json['name'],
      symbol: json['symbol'],
      urlImage: json['image'],
      price: json['current_price'],
      changeInPercentage: json['price_change_percentage_24h'],
    );
  }
}
