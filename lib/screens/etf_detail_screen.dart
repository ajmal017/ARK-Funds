import '../dummy_data.dart';

import '../widgets/fund_description.dart';
import '../models/custom_list_view_etf.dart';

import 'package:flutter/material.dart';

class EtfDetailScreen extends StatefulWidget {
  static const routeName = '/etf-detail-screen';
  @override
  _EtfDetailScreenState createState() => _EtfDetailScreenState();
}

class _EtfDetailScreenState extends State<EtfDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final etfId = ModalRoute.of(context).settings.arguments as String;
    final selectedEtf = (DUMMY_CATEGORIES1 + DUMMY_CATEGORIES2)
        .firstWhere((etf) => etf.id == etfId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedEtf.title),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Container(
        child: Column(
          children: [
            FundDescription(
              etfTitle: selectedEtf.title,
            ),
            CustomListViewEtf(selectedEtf.id, selectedEtf.subtitle),
          ],
        ),
      ),
    );
  }
}
