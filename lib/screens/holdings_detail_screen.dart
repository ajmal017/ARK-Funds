

import 'package:arkfundsapp/models/holdings_screen_ListView.dart';

import 'package:flutter/material.dart';

class HoldingsDetailScreen extends StatefulWidget {
  static const routeName = '/holdings-detail-screen';
  @override
  _HoldingsDetailScreenState createState() => _HoldingsDetailScreenState();
}

class _HoldingsDetailScreenState extends State<HoldingsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final holdingObj = ModalRoute.of(context).settings.arguments as Holding;
    List<dynamic> holding = holdingObj.holding;
    return Scaffold(
      appBar: AppBar(
        title: Text(holdingObj.company),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromRGBO(247, 247, 247, 1),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              'AS OF DATE - ' + holdingObj.date,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'SF-Pro-Text',
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  holdingObj.company,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro-Text',
                  ),
                ),
                Text(
                  holdingObj.ticker,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 13),
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            holding[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF-Pro-Text',
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Text(
                            holding[index]['value'],
                            style: TextStyle(
                              fontFamily: 'SF-Pro-Text',
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
              itemCount: holding.length,
            ),
          ),
        ],
      ),
    );
  }
}
