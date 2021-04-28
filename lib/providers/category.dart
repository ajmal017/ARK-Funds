import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Category {
  final String id;
  final String title;
  final String subtitle;
  final String amount;

  Category({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.amount,
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
      print(groupProducts);
      _products = groupProducts.map((groupProduct) {
        print(groupProduct);
        FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
            amount: groupProduct['fundDetail']['netAssets'].toDouble());
        return Category(
          id: groupProduct['id'].toString(),
          title: groupProduct['name'],
          subtitle: groupProduct['fundDetail']['ticker'],
          amount: (fmf.output.compactSymbolOnLeft).toString(),
        );
      }).toList();
      // List<Category> products = [];
      // for (int i = 0; i < groupProducts.length; i++) {
      //   FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
      //       amount: groupProducts[i]['fundDetail']['netAssests']);
      //   products.add(Category(
      //     id: groupProducts[i]['id'].toString(),
      //     title: groupProducts[i]['name'],
      //     subtitle: groupProducts[i]['fundDetail']['ticker'],
      //     amount: (fmf.output.compactSymbolOnLeft).toString(),
      //   ));
      // }
      // print(products);
      groups.insert(groupIndex - 1, _products);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
