import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:flutter/material.dart';

class DetailFundDescription extends StatelessWidget {
  static const routeName = '/detail-fund-description';
  @override
  Widget build(BuildContext context) {
    final etf = ModalRoute.of(context).settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          etf.title,
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
            fontWeight: FontWeight.w600,
          ),
        ),
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
                etf.description,
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
