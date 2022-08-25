import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frocrypto/data/repositories/coin_repository.dart';
import 'package:frocrypto/assets/constants.dart';
import 'package:frocrypto/view/pages/empty_page.dart';

import '../../data/model/coin_model.dart';
import '../widgets/coin_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  updateList() {
    setState(() {});
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
              StreamBuilder<List<CoinModel>>(
                stream: CoinRepository.getCoinAPI(),
                // initialData: initialData,
                builder: (context, AsyncSnapshot<List<CoinModel>> snapshot) {
                  final users = snapshot.data;

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    default:
                      if (snapshot.hasError) {
                        debugPrint(snapshot.error.toString());
                        return const Expanded(child: EmptyPage());
                      } else {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await Future.delayed(const Duration(seconds: 2));
                              updateList();
                            },
                            child: ListView.builder(
                              itemCount: users!.length,
                              itemBuilder: (context, index) {
                                final user = users[index];
                                return CoinCard(
                                  name: user.name,
                                  symbol: user.symbol,
                                  urlImage: user.urlImage,
                                  price: user.price.toDouble(),
                                  changeInPercentage:
                                      user.changeInPercentage.toDouble(),
                                );
                              },
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
