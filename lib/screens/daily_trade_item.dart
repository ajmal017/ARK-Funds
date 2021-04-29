import 'package:arkfundsapp/providers/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../dummy_data.dart';

class DailyTradeItem extends StatelessWidget {
  static const routeName = '/daily-trade-item';
  @override
  Widget build(BuildContext context) {
    final dummyList = ModalRoute.of(context).settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(dummyList.title),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Container(
        color: Color(0xFFF2F2F7),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Trade Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                      fontFamily: 'SF-Pro-Text',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 20,
                top: 15,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dummyList.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF-Pro-Text',
                    ),
                  ),
                  Text(
                    dummyList.subtitle,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              DailyTradeItemList[index]['title'],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF-Pro-Text',
                              ),
                            ),
                            Spacer(),
                            Text(
                              DailyTradeItemList[index]['detail'],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
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
                  itemCount: DailyTradeItemList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
