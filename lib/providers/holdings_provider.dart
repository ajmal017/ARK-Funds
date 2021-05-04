import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HoldingsObject {
  final int id;
  final String name;
  final String date;
  final List<dynamic> holdings;

  HoldingsObject({
    this.id,
    this.name,
    this.date,
    this.holdings,
  });
}

class HoldingsProvider with ChangeNotifier {
  List<HoldingsObject> _holdingsList = [];
  List<HoldingsObject> get holdingsList {
    return [..._holdingsList];
  }

  Future<void> fetchHoldings(int id) async {
    final url =
        Uri.parse('https://api-fundmanager.kiranum.com/products/$id/holdings');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
     
      _holdingsList.add(
        HoldingsObject(
          id: extractedData['id'],
          name: extractedData['name'],
          date: DateFormat('dd-MM-yyyy')
              .format(DateTime.parse(extractedData['refreshDate']))
              .toString(),
          holdings: extractedData['holdings'],
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
