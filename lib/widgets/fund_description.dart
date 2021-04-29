import '../screens/detail_fund_description.dart';
import '../dummy_data.dart';

import 'package:flutter/material.dart';

class FundDescription extends StatelessWidget {
  final String etfTitle;
  FundDescription({
    @required this.etfTitle,
  });
  void fundDescription(BuildContext context, String etfTitle) {
    Navigator.of(context)
        .pushNamed(DetailFundDescription.routeName, arguments: etfTitle);
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
              FUND_DESCRIPTION[0],
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
            onPressed: () => fundDescription(context, etfTitle),
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
