import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/coin_model.dart';

class CoinRepository {
  final _baseUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Coin> coin = it.map((e) => Coin.fromJson(e)).toList();
        return coin;
      }
    } catch (e) {
      debugPrint('CoinRepository: ${e.toString()}');
    }
  }
}
