import 'package:flutter/material.dart';

import '../dummy_data.dart';

class NavAndMarketPrice extends StatelessWidget {
  static const routeName = '/nav-and-market-price';
  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final etfId = etfDetails['id'];
    final fundTitle = etfDetails['title'];
    final selectedEtf = (DUMMY_CATEGORIES1 + DUMMY_CATEGORIES2)
        .firstWhere((etf) => etf.id == etfId);
    return Scaffold(
      appBar: AppBar(
        title: Text(fundTitle),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(
            top: 16,
            bottom: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                Nav_And_Market_Price[index]['title'],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                Nav_And_Market_Price[index]['detail'],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Divider(
                thickness: 0.5,
                height: 4,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        itemCount: Nav_And_Market_Price.length,
      ),
    );
  }
}
