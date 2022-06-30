import 'package:crypto/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:crypto/components/card_widget.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Crypto Converter'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Expanded(
                  child: Cryptocard(
                    title: Text(
                      '1 BTC = 5055 CNY',
                      style: kBodyTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Cryptocard(
                    title: Text(
                      '1 ETH = 5505 CNY',
                      style: kBodyTextStyle,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Cryptocard(
                    title: Text(
                      '1 LTC = 5505 CNY',
                      style: kBodyTextStyle,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              height: 200,
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'BTC',
                    style: kBottomsheetText,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
