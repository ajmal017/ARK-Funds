import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Funds {
  final int id;
  final String name;
  final String description;

  Funds(this.id, this.name, this.description);
}

class FundGroups with ChangeNotifier {
  List<Funds> _funds = [];
  List<Funds> get funds {
    return [..._funds];
  }

  Future<void> fetchFunds() async {
    final url =
        Uri.parse('https://api-fundmanager.kiranum.com/fund-managers/1');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print(extractedData);
      final fundGroups = extractedData['fundGroups'] as List;
      _funds = fundGroups.map((fundGroup) {
        return Funds(
          fundGroup['id'],
          fundGroup['name'],
          fundGroup['description'],
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
