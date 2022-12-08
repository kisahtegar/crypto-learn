import 'package:flutter/material.dart';
import 'package:frocrypto/view/pages/coin_page.dart';
import 'package:intl/intl.dart';

import '../../assets/constants.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    Key? key,
    required this.users,
    required this.name,
    required this.symbol,
    required this.urlImage,
    required this.price,
    required this.changeInPercentage,
  }) : super(key: key);

  final dynamic users;
  final String name;
  final String symbol;
  final String urlImage;
  final double price;
  final double changeInPercentage;
  final formatterPrice = NumberFormat("#,##0.00########", "en_US");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CoinPage(
                    users: users,
                  ))),
          child: SizedBox(
            height: 65,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: urlImage.isNotEmpty
                      ? NetworkImage(urlImage)
                      : const AssetImage('images/not_found.png')
                          as ImageProvider,
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
                        "${symbol.toUpperCase()}/USD",
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
                      '\$${formatterPrice.format(price)}',
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
        ),
        const Divider(),
      ],
    );
  }
}
