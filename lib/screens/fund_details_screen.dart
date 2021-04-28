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
        title: Text(fundTitle),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    Dummy_fund_details[index]['detail'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
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
