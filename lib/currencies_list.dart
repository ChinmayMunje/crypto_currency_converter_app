import 'package:http/http.dart'as http;
import 'dart:convert';

const List <String> currenciesList = [
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

const List<String> cryptoList = ['BTC','ETH', 'LTC'];

const APIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = '2CC6853F-540D-41D2-9B20-660BB38E8996';

class Currency_List {
  Future getCurrency_List(String selectedCurrency) async {
    Map<String, String>cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL = '$APIURL/$crypto/$selectedCurrency?apikey=$apikey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with get request';
      }
    }
    return cryptoPrices;
  }
}