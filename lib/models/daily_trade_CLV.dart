import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/screens/daily_trade_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class DailyTradesCLV extends StatelessWidget {
  final List<Category> dummyList;
  final String dummyTitle;
  DailyTradesCLV(this.dummyList, this.dummyTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
              bottom: 15,
            ),
            color: Color(0xFFF2F2F7),
            child: Text(
              dummyTitle,
              style: TextStyle(fontFamily: 'SF-Pro-Text'),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                        DailyTradeItem.routeName,
                        arguments: dummyList[index]),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'BUY',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  dummyList[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'SF-Pro-Text'),
                                  maxLines: 2,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                dummyList[index].subtitle,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                FlutterMoneyFormatter(
                                        amount: dummyList[index].amount)
                                    .output
                                    .compactSymbolOnLeft,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'SF-Pro-Text',
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios),
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
            itemCount: dummyList.length,
          ),
        ],
      ),
    );
  }
}
