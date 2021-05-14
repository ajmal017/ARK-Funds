import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Category {
  final int id;
  final String title;
  final String subtitle;
  final double amount;
  final String description;

  Category({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.amount,
    this.description,
  });
}

class FundProductGroup with ChangeNotifier {
  List _groups = [];
  List get groups {
    return [..._groups];
  }

  List<Category> _products = [];

  Future<void> fetchProducts(int groupIndex) async {
    final url = Uri.parse(
        'https://api-fundmanager.kiranum.com/fund-managers/1/groups/$groupIndex/products');
    try {
      final response = await http.get(url);
      final groupProducts = json.decode(response.body) as List;
      if (groupProducts == null) {
        return;
      }
      _products = groupProducts.map((groupProduct) {
        // print(groupProduct['description']);
        return Category(
          id: groupProduct['id'],
          title: groupProduct['name'],
          subtitle: groupProduct['fundDetail']['ticker'],
          amount: groupProduct['fundDetail']['netAssets'].toDouble(),
          description: groupProduct['description'],
        );
      }).toList();
      _groups.insert(groupIndex - 1, _products);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
