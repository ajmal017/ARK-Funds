import 'package:arkfundsapp/providers/navPrice_chartProvider.dart';
import 'package:arkfundsapp/widgets/nav_market_price_chart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PremiumDiscountChartProvider with ChangeNotifier {
  List<ChartDataObject> _chartList = [];
  List<ChartDataObject> get chartList {
    return [..._chartList];
  }

  Future<void> fetchPremiumDiscountData(int id) async {
    final url = Uri.parse(
        'https://api-fundmanager.kiranum.com/products/$id/premium-discount-data');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      final chartData = extractedData[0]['data'] as List;
      List<TimeSeriesSales> list = chartData.map((ch) {
        return TimeSeriesSales(
          DateTime.parse(DateFormat('yyyy-MM-dd')
              .format(DateTime.fromMillisecondsSinceEpoch(ch[0]))),
          ch[1].toDouble(),
        );
      }).toList();
      _chartList.add(ChartDataObject(id, list));
      print(chartData);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
