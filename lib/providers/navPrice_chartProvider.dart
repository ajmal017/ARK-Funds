import 'package:arkfundsapp/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NavPriceChartProvider with ChangeNotifier {
  List _chartList = [];
  List get chartList {
    return [..._chartList];
  }

  Future<void> fetchNav(int id) async {
    final url =
        Uri.parse('https://api-fundmanager.kiranum.com/products/$id/nav-data');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      if (extractedData == null) {
        return;
      }
      List<TimeSeriesSales> list = extractedData.map((ch) {
        return TimeSeriesSales(
          DateTime.parse(DateFormat('yyyy-MM-dd')
              .format(DateTime.fromMillisecondsSinceEpoch(ch[0]))),
          ch[1].toDouble(),
        );
      }).toList();
      _chartList.add(list);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
