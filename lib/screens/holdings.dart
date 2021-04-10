import 'package:arkfundsapp/models/holdings_model.dart';
import 'package:arkfundsapp/models/holdings_model_graph.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../dummy_data.dart';

class Holdings extends StatelessWidget {
  final date = DateFormat.yMMMd().format(DateTime.now()).toString();
  static const routeName = '/holdiings';
  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final etfId = etfDetails['id'];
    final fundTitle = etfDetails['title'];
    final selectedEtf = (DUMMY_CATEGORIES1 + DUMMY_CATEGORIES2)
        .firstWhere((etf) => etf.id == etfId);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(fundTitle),
          backgroundColor: Color.fromRGBO(247, 247, 247, 1),
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(
                child: Text('List view'),
              ),
              Tab(
                child: Text('Graph View'),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(
                'AS OF DATE - ' + date,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.9,
              child: TabBarView(
                children: [
                  HoldingsModel(
                    HoldingsData,
                    date,
                  ),
                  HoldingsModelGraph(
                    HoldingsData,
                    date,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
