import 'package:arkfundsapp/screens/arkk_performance.dart';
import 'package:arkfundsapp/screens/fund_details_screen.dart';
import 'package:arkfundsapp/screens/fund_documents.dart';
import 'package:arkfundsapp/screens/holdings.dart';
import 'package:arkfundsapp/screens/nav_and_market_price_screen.dart';
import 'package:arkfundsapp/screens/premium_discount.dart';

import 'package:flutter/material.dart';

class CustomListViewEtf extends StatelessWidget {
  final navigators = [
    FundDetailsScreen.routeName,
    NavAndMarketPrice.routeName,
    ArkkPerformance.routeName,
    Holdings.routeName,
    PremiumDiscount.routeName,
    FundDocuments.routeName,
  ];
  final DUMMY_CATEGORIES3 = [
    'Fund Details',
    'NAV and Market Price',
    'ARKK Performance',
    'Holdings',
    'Premium / Discount',
    'Fund Documents',
  ];
  final String id;
  CustomListViewEtf(this.id);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (ctx, index) => InkWell(
          onTap: () => Navigator.of(context).pushNamed(navigators[index],
              arguments: {'id': id, 'title': DUMMY_CATEGORIES3[index]}),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: 8,
              bottom: 4,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  DUMMY_CATEGORIES3[index],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        itemCount: DUMMY_CATEGORIES3.length,
      ),
    );
  }
}
