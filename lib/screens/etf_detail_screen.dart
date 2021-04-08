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
    final etfTitle = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(etfTitle),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 186,
              child: FundDescription(etfTitle: etfTitle,),
            ),
            SizedBox(
              height: 300,
              child: CustomListViewEtf(),
            ),
          ],
        ),
      ),
    );
  }
}
