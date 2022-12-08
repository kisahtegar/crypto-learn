import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../pages/coin_page.dart';

class PriceInfo extends StatelessWidget {
  const PriceInfo({
    Key? key,
    required this.formatterPrice,
    required this.widget,
    required this.firstTitle,
    required this.firstContent,
    required this.secTitle,
    required this.secContent,
    // required this.widget,
  }) : super(key: key);

  final NumberFormat formatterPrice;
  final CoinPage widget;
  final String firstTitle;
  final String firstContent;
  final String secTitle;
  final String secContent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            firstTitle,
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 161, 153, 153),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            firstContent,
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 36, 34, 34),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            secTitle,
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 161, 153, 153),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            secContent,
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 36, 34, 34),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
