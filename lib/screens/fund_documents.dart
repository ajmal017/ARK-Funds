import 'package:flutter/material.dart';

import '../dummy_data.dart';

class FundDocuments extends StatelessWidget {
  static const routeName = '/fund-documents';
  final fund_documents = [
    'Fact Sheet',
    'Prospectus',
    'Summary Prospectus',
    'Fund Holdiings'
        'Fund holdings CSV',
    'Month-End Performance',
    'Quarterly Report',
    'Semi-Annual Report',
    'Annual Report',
    'SAI'
  ];
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
      body: InkWell(
        onTap: null,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
                      fund_documents[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                  //height: 4,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          itemCount: fund_documents.length,
        ),
      ),
    );
  }
}
