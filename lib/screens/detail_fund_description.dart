import 'package:flutter/material.dart';

import '../dummy_data.dart';

class DetailFundDescription extends StatelessWidget {
  static const routeName = '/detail-fund-description';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'Fund Description and Objective',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF-Pro-Text',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                FUND_DESCRIPTION[0],
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SF-Pro-Text',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
