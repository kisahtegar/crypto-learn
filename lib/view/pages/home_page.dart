import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frocrypto/data/repositories/coin_repository.dart';
import 'package:frocrypto/assets/constants.dart';

import '../../data/model/coin_model.dart';
import '../widgets/coin_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Coin> listCoin = [];
  CoinRepository coinRepository = CoinRepository();

  getData() async {
    listCoin = await coinRepository.getData();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    Timer.periodic(const Duration(seconds: 10), (timer) => getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Market',
                style: kTitleTextStyle,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listCoin.length,
                  itemBuilder: (context, index) {
                    // final listCoins = listCoin[index];
                    return CoinCard(
                      name: listCoin[index].name,
                      symbol: listCoin[index].symbol,
                      urlImage: listCoin[index].urlImage,
                      price: listCoin[index].price.toDouble(),
                      changeInPercentage:
                          listCoin[index].changeInPercentage.toDouble(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
