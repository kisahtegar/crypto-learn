class CoinModel {
  final String name;
  final String symbol;
  final String urlImage;
  final num price;
  final num changeInPercentage;
  final num highH;
  final num lowH;
  final num totalVolume;
  final num rank;

  const CoinModel({
    required this.name,
    required this.symbol,
    required this.urlImage,
    required this.price,
    required this.changeInPercentage,
    required this.highH,
    required this.lowH,
    required this.totalVolume,
    required this.rank,
  });

  factory CoinModel.fromJson(json) {
    return CoinModel(
      name: json['name'],
      symbol: json['symbol'],
      urlImage: json['image'],
      price: json['current_price'],
      changeInPercentage: json['price_change_percentage_24h'],
      highH: json['high_24h'],
      lowH: json['low_24h'],
      totalVolume: json['total_volume'],
      rank: json['market_cap_rank'],
    );
  }
}
