import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FundTotalMarketValue with ChangeNotifier {
  DateTime date;
  double currentValue;
  double previousValue;
  Future<void> fetchIntro() async {
    final url = Uri.parse(
        'https://api-fundmanager.kiranum.com/fund-managers/1/total-market-value');
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data == null) {
        return;
      }
      date = DateTime.parse(data['refreshDate']);
      currentValue = data['current'];
      previousValue = data['previous'];
      print(date);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}