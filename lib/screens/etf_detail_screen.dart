import 'package:arkfundsapp/providers/category.dart';

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
    final etfListItem = ModalRoute.of(context).settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(etfListItem.title),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Container(
        child: Column(
          children: [
            FundDescription(
              etfTitle: etfListItem.title,
            ),
            CustomListViewEtf(etfListItem, etfListItem.subtitle),
          ],
        ),
      ),
    );
  }
}
