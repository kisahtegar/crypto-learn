import 'package:flutter/material.dart';

import '../../assets/constants.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.urlImage,
    required this.price,
    required this.changeInPercentage,
  }) : super(key: key);

  final String name;
  final String symbol;
  final String urlImage;
  final double price;
  final double changeInPercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(urlImage),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kCryptoTextStyle,
                    ),
                    Text(
                      symbol,
                      style: kSubTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${price.toDouble()}',
                    style: kCryptoTextStyle,
                  ),
                  Text(
                    changeInPercentage.toDouble() < 0
                        ? '${changeInPercentage.toDouble().toStringAsFixed(2)}%'
                        : '+${changeInPercentage.toDouble().toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 15,
                      color: changeInPercentage.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
