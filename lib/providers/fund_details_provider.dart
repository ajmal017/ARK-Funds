import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FundDetailsObject {
  final int id;
  final List<Map<String, String>> fundDetails;

  FundDetailsObject({this.id, this.fundDetails});
}

class FundDetailsProvider with ChangeNotifier {
  List<FundDetailsObject> _fundDetailsList = [];
  List<FundDetailsObject> get fundDetails {
    return [..._fundDetailsList];
  }

  String moneyFormatter(double amount) {
    return FlutterMoneyFormatter(amount: amount).output.compactSymbolOnLeft;
  }

  Future<void> fetchFundDetails(int id) async {
    final url = Uri.parse('https://api-fundmanager.kiranum.com/products/$id');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      _fundDetailsList.add(
        FundDetailsObject(
          id: extractedData['id'],
          fundDetails: [
            {
              'title': 'Fund Name',
              'detail': extractedData['name'],
            },
            {
              'title': 'Ticker',
              'detail': extractedData['fundDetail']['ticker'],
            },
            {
              'title': 'Fund Type',
              'detail': extractedData['fundDetail']['fundType'],
            },
            {
              'title': 'CUSIP',
              'detail': extractedData['fundDetail']['cusip'],
            },
            {
              'title': 'ISIN',
              'detail': extractedData['fundDetail']['isin'],
            },
            {
              'title': 'Primary Exchange',
              'detail': extractedData['fundDetail']['primaryExchange'],
            },
            {
              'title': 'Inception Date',
              'detail': extractedData['fundDetail']['inceptionDate'],
            },
            {
              'title': 'Net Assets',
              'detail': extractedData['fundDetail']['netAssets'],
            },
            {
              'title': 'Expense Ratio',
              'detail': extractedData['fundDetail']['expenseRatio'].toString(),
            },
            {
              'title': 'Indicative Value',
              'detail': extractedData.containsKey('indicativeValue')
                  ? extractedData['fundDetail']['indicativeValue']
                  : '-',
            },
            {
              'title': 'Net Asset Value(NAV)',
              'detail': extractedData.containsKey('nav')
                  ? extractedData['fundDetail']['nav']
                  : '-',
            },
            {
              'title': 'Typical # of Holdings',
              'detail': extractedData['fundDetail']['numHoldings'],
            },
            {
              'title': 'Weighted Avg Market CAP',
              'detail': extractedData['fundDetail']['weightedAvgMarketCap'],
            },
            {
              'title': 'Median Market CAP',
              'detail': extractedData['fundDetail']['medianMarketCap'],
            },
            {
              'title': 'Portfolio Managers',
              'detail': extractedData.containsKey('portfolioManager')
                  ? extractedData['fundDetail']['portfolioManager']
                  : '-',
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
