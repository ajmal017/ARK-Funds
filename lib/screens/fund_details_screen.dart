import 'package:arkfundsapp/providers/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../dummy_data.dart';

class FundDetailsScreen extends StatelessWidget {
  static const routeName = '/fund-detail-screen';

  @override
  Widget build(BuildContext context) {
    final etfDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final Category etfListItem = etfDetails['listItem'];
    final fundTitle = etfDetails['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          fundTitle,
          style: TextStyle(
            fontFamily: 'SF-Pro-Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          margin: EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
          ),
          padding: EdgeInsets.only(
            top: 12,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    Dummy_fund_details[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'SF-Pro-Text',
                    ),
                  ),
                  Spacer(),
                  Text(
                    Dummy_fund_details[index]['detail'],
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      fontFamily: 'SF-Pro-Text',
                    ),
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
        itemCount: Dummy_fund_details.length,
      ),
    );
  }
}
