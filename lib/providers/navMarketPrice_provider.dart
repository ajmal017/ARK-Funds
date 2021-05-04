import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NavMarketPriceObject {
  final int id;
  final List<Map<String, String>> marketDetails;

  NavMarketPriceObject({this.id, this.marketDetails});
}

class NavMarketPriceProvider with ChangeNotifier {
  List<NavMarketPriceObject> _navMarketPriceList = [];
  List<NavMarketPriceObject> get navMarketPriceList {
    return [..._navMarketPriceList];
  }

  String moneyFormatter(double amount) {
    return FlutterMoneyFormatter(amount: amount).output.compactSymbolOnLeft;
  }

  Future<void> fetchMarketDetails(int id) async {
    final url = Uri.parse(
        'https://api-fundmanager.kiranum.com/products/$id/nav-market-price');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      _navMarketPriceList.add(
        NavMarketPriceObject(
          id: extractedData['id'],
          marketDetails: [
            {
              'title': 'Fund Name',
              'detail': extractedData['name'],
            },
            {
              'title': 'As of Date',
              'detail': DateFormat('dd-MM-yyyy')
                  .format(DateTime.parse(
                      extractedData['navMarketPrice']['refreshDate']))
                  .toString(),
            },
            {
              'title': 'NAV',
              'detail': moneyFormatter(extractedData['navMarketPrice']['nav']),
            },
            {
              'title': 'NAV Change',
              'detail': extractedData['navMarketPrice']['navChange'],
            },
            {
              'title': 'Market Price',
              'detail': moneyFormatter(
                  extractedData['navMarketPrice']['marketPrice']),
            },
            {
              'title': 'Market Price Change',
              'detail': extractedData['navMarketPrice']['marketPriceChange'],
            },
            {
              'title': 'Median Bid/Ask Spread(30 day)',
              'detail':
                  extractedData['navMarketPrice']['medianBidAsk'].toString() +
                      '%',
            },
            {
              'title': 'Day\'s Trading Volume',
              'detail':
                  extractedData['navMarketPrice']['tradeVolume'].toString() +
                      ' shares',
            },
          ],
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
