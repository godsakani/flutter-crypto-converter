import 'package:http/http.dart';
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const apiKey = '';
const coinURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinModel {
  Future getCoinData(String selectCoin) async {
    Map<String, String> cryptoPrice = {};
    for( String crypto in cryptoList) {
    String url = '$coinURL$crypto$selectCoin?apikey=$apiKey';
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);

      throw 'Problem with the get request';
    }
    }
    return cryptoPrice;
  }
}
