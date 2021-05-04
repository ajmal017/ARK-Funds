import 'package:arkfundsapp/models/holdingsScreen_listView.dart';
import 'package:arkfundsapp/providers/holdings_provider.dart';
import 'package:arkfundsapp/screens/holdings_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class HoldingsGraphView extends StatelessWidget {
  final HoldingsObject holdingObj;
  HoldingsGraphView(this.holdingObj);

  void selectHolding(BuildContext context, Holding holding) {
    Navigator.of(context)
        .pushNamed(HoldingsDetailScreen.routeName, arguments: holding);
  }

  String moneyFormatter(double amount) {
    return FlutterMoneyFormatter(amount: amount).output.compactSymbolOnLeft;
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> holdings = holdingObj.holdings;
    return SingleChildScrollView(
      child: ListView.builder(
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
                        'value': moneyFormatter(holdings[index]['marketValue'] /
                            holdings[index]['numShares'])
                      },
                      {
                        'title': 'Market Value',
                        'value':
                            '\$ ' + holdings[index]['marketValue'].toString(),
                      },
                    ],
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 12,
                    top: 12,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.55,
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
                      Spacer(),
                      SizedBox(
                        height: 15,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            color: Color.fromRGBO(220, 220, 220, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 15,
                            width: MediaQuery.of(context).size.width *
                                0.35 *
                                (holdings[index]['weight'] / 100),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
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
    );
  }
}
