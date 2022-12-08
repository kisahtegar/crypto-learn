import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/price_info_widget.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({
    super.key,
    this.users,
  });

  final dynamic users;

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  var formatterPrice = NumberFormat("#,##0.00########", "en_US");
  var formatterVol = NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.users.symbol.toUpperCase()}/USD',
          style: const TextStyle(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${formatterPrice.format(widget.users.price.toDouble())}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '=\$${formatterPrice.format(widget.users.price.toDouble())}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 112, 107, 107),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.users.changeInPercentage.toDouble() < 0
                                ? '${widget.users.changeInPercentage.toDouble().toStringAsFixed(2)}%'
                                : '+${widget.users.changeInPercentage.toDouble().toStringAsFixed(2)}%',
                            style: TextStyle(
                              color:
                                  widget.users.changeInPercentage.toDouble() < 0
                                      ? Colors.red
                                      : Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PriceInfo(
                  formatterPrice: formatterPrice,
                  widget: widget,
                  firstTitle: '24H High',
                  firstContent:
                      '\$${formatterPrice.format(widget.users.highH)}',
                  secTitle: '24H Low',
                  secContent: '\$${formatterPrice.format(widget.users.lowH)}',
                ),
                PriceInfo(
                  formatterPrice: formatterPrice,
                  widget: widget,
                  firstTitle: '24H Vol',
                  firstContent:
                      '\$${formatterVol.format(widget.users.totalVolume)}',
                  secTitle: 'Rank',
                  secContent: '#${widget.users.rank.toString()}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
