import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FundDocObject {
  final int id;
  final String name;
  final List<dynamic> documents;

  FundDocObject({this.id, this.name, this.documents});
}

class FundDocumentsProvider with ChangeNotifier {
  List<FundDocObject> _fundDocumentList = [];
  List<FundDocObject> get fundDocument {
    return [..._fundDocumentList];
  }

  Future<void> fetchFundDocs(int id) async {
    final url =
        Uri.parse('https://api-fundmanager.kiranum.com/products/$id/documents');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      _fundDocumentList.add(
        FundDocObject(
          id: extractedData['id'],
          name: extractedData['name'],
          documents: extractedData['documents'],
        )
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
