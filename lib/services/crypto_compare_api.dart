import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoCompareAPI {

  final String baseUrl = 'https://min-api.cryptocompare.com/data/pricemultifull';

  Future<Map<String, dynamic>> fetchPrices(List<String> currencies) async {
    Map<String, dynamic> prices = {};

    String currencyList = currencies.join(',');
    String url = '$baseUrl?fsyms=$currencyList&tsyms=USD';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      currencies.forEach((currency) {
        prices[currency] = data['RAW'][currency]['USD'];
      });
    } else {
      throw Exception('Failed to load prices');
    }

    return prices;
  }
}