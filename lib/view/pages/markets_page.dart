import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frocrypto/data/repositories/coin_repository.dart';
import 'package:frocrypto/assets/constants.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/model/coin_model.dart';
import '../widgets/coin_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _getCoinAPI = CoinRepository.getCoinAPI();

  updateList() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getCoinAPI;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Market',
              style: kTitleTextStyle,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: StreamBuilder<List<CoinModel>>(
            stream: _getCoinAPI,
            // stream: CoinRepository.getCoinAPI(),
            builder: (context, AsyncSnapshot<List<CoinModel>> snapshot) {
              final users = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    debugPrint(
                        'Snapshot.hasError: ${snapshot.error.toString()}');
                    return emptyPage();
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(const Duration(seconds: 2));
                        updateList();
                      },
                      child: ListViewCoin(users: users),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }

  Center emptyPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Oops.. Something Error',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'The page you are looking for doesn\'t \nseem to exit. Maybe you are offline',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 143, 139, 139),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              updateList();
            },
            child: const Text(
              'TRY AGAIN',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewCoin extends StatelessWidget {
  const ListViewCoin({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<CoinModel>? users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users!.length,
      itemBuilder: (context, index) {
        final user = users![index];
        // return CoinCardShimmer();
        return CoinCard(
          users: user,
          name: user.name,
          symbol: user.symbol,
          urlImage: user.urlImage,
          price: user.price.toDouble(),
          changeInPercentage: user.changeInPercentage.toDouble(),
        );
      },
    );
  }
}
