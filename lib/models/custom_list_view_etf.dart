import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/screens/performance.dart';
import 'package:arkfundsapp/screens/fund_details_screen.dart';
import 'package:arkfundsapp/screens/fund_documents.dart';
import 'package:arkfundsapp/screens/holdings.dart';
import 'package:arkfundsapp/screens/nav_and_market_price_screen.dart';
import 'package:arkfundsapp/screens/premium_discount.dart';

import 'package:flutter/material.dart';

class CustomListViewEtf extends StatelessWidget {
  final Category listItem;
  final String ticker;
  CustomListViewEtf(this.listItem, this.ticker);

  final navigators = [
    FundDetailsScreen.routeName,
    NavAndMarketPrice.routeName,
    ArkkPerformance.routeName,
    Holdings.routeName,
    PremiumDiscount.routeName,
    FundDocuments.routeName,
  ];

  final _etfCategories = [
    'Fund Details',
    'NAV and Market Price',
    'Performance',
    'Holdings',
    'Premium / Discount',
    'Fund Documents',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) => InkWell(
          onTap: () => Navigator.of(context).pushNamed(navigators[index],
              arguments: {'listItem': listItem, 'title': _etfCategories[index]}),
          child: Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      _etfCategories[index] == 'Performance'
                          ? ticker + ' Performance'
                          : _etfCategories[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF-Pro-Text',
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        itemCount: _etfCategories.length,
      ),
    );
  }
}
