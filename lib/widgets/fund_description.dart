import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import '../screens/detail_fund_description.dart';
import 'package:flutter/material.dart';

class FundDescription extends StatelessWidget {
  final Category etf;
  FundDescription({
    @required this.etf,
  });
  void fundDescription(BuildContext context, Category etf) {
    Navigator.of(context)
        .pushNamed(DetailFundDescription.routeName, arguments: etf);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontFamily: 'SF-Pro-Text'
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              etf.description,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'SF-Pro-Text'
              ),
            ),
          ),
          TextButton(
            onPressed: () => fundDescription(context, etf),
            child: Text(
              'Read more...',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
