import 'package:crypto/models/crpto.dart';
import 'package:crypto/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:crypto/components/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);
  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  String selectedCurrency = 'AUD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      iconEnabledColor: Colors.white,
      dropdownColor: Colors.black45,
      style: kBottomsheetText,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value.toString();
          getCoin();
        });
      },
    );
  }

  CupertinoPicker IOSPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      Text(currency);
      pickerItem.add(Text(
        currency,
        style: kBottomsheetText,
      ));
    }

    return CupertinoPicker(
      backgroundColor: Colors.blue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getCoin();
        });
      },
      children: pickerItem,
    );
  }

  Map<String, String> coinValues = {};

  bool isWaiting = false;

  String bitValue = '?';

  void getCoin() async {
    isWaiting = true;
    try {
      var data = await CoinModel().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCoin();
  }

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
              children: <Widget>[
                Expanded(
                  child: Cryptocard(
                    title: Text(
                      '1 BTC = $bitValue $selectedCurrency',
                      style: kBodyTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Cryptocard(
                    title: Text(
                      '1 ETH = $bitValue $selectedCurrency',
                      style: kBodyTextStyle,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Cryptocard(
                    title: Text(
                      '1 LTC = $bitValue $selectedCurrency',
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
              child: Center(
                child: Platform.isIOS ? IOSPicker() : androidDropdown(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
