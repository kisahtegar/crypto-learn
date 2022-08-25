import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/coin_model.dart';

class CoinRepository {
  static Stream<List<CoinModel>> getCoinAPI() =>
      Stream.periodic(const Duration(seconds: 4))
          .asyncMap((_) => getCoinAPIs());

  static Future<List<CoinModel>> getCoinAPIs() async {
    const baseUrl =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    final response = await http.get(Uri.parse(baseUrl));
    final body = json.decode(response.body);

    return body.map<CoinModel>(CoinModel.fromJson).toList();
  }
}
