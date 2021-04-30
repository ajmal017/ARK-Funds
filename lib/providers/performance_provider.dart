import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PerformanceObject {
  final int id;
  final String name;
  final List<dynamic> performance;

  PerformanceObject({this.id, this.name, this.performance});
}

class PerformanceProvider with ChangeNotifier {
  List<PerformanceObject> _performanceList = [];
  List<PerformanceObject> get performanceList {
    return [..._performanceList];
  }

  Future<void> fetchPerformace(int id) async {
    final url = Uri.parse(
        'https://api-fundmanager.kiranum.com/products/$id/performance');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      _performanceList.add(
        PerformanceObject(
          id: extractedData['id'],
          name: extractedData['name'],
          performance: extractedData['performance'],
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
