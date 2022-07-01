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
  String selectedCurrency = 'USD';

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
      },
      children: pickerItem,
    );
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
