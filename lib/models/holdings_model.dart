import 'package:arkfundsapp/providers/holdings_provider.dart';
import 'package:arkfundsapp/screens/holdings_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Holding {
  final String company;
  final String ticker;
  final String date;
  final List<dynamic> holding;

  Holding({this.company, this.ticker, this.date, this.holding});
}

class HoldingsModel extends StatelessWidget {
  final HoldingsObject holdingObj;
  HoldingsModel(this.holdingObj);
  void selectHolding(BuildContext context, Holding holding) {
    Navigator.of(context).pushNamed(
      HoldingsDetailScreen.routeName,
      arguments: holding,
    );
  }

  String moneyFormatter(double amount) {
    return FlutterMoneyFormatter(amount: amount).output.compactSymbolOnLeft;
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> holdings = holdingObj.holdings;
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => selectHolding(
                      context,
                      Holding(
                        company: holdings[index]['company'],
                        ticker: holdings[index]['ticker'],
                        date: holdingObj.date,
                        holding: [
                          {
                            'title': 'Weight',
                            'value': holdings[index]['weight'].toString() + '%',
                          },
                          {
                            'title': 'Shares Held',
                            'value': holdings[index]['numShares'].toString(),
                          },
                          {
                            'title': 'Market Price',
                            'value': moneyFormatter(holdings[index]
                                    ['marketValue'] /
                                holdings[index]['numShares']),
                          },
                          {
                            'title': 'Market Value',
                            'value': '\$ ' +
                                holdings[index]['marketValue'].toString(),
                          },
                        ],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.zero,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 16,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  holdings[index]['company'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SF-Pro-Text',
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                holdings[index]['ticker'] != null
                                    ? holdings[index]['ticker']
                                    : '-',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${holdings[index]['weight']}%',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'SF-Pro-Text',
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    height: 3,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              );
            },
            itemCount: holdings.length,
          ),
        ],
      ),
    );
  }
}
