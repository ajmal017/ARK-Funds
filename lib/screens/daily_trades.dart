import 'package:arkfundsapp/dummy_data.dart';
import 'package:arkfundsapp/models/daily_trade_CLV.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyTrades extends StatelessWidget {
  static const routeName = '/daily-trades';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Trades'),
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      ),
      body: Container(
        color: Color(0xFFF2F2F7),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DailyTradesCLV(
              Daily_trades1,
              255,
              'ARKG - GENOMIC REVOLUTION ETF',
            ),
            DailyTradesCLV(
              Daily_trades2,
              340,
              'ARKQ - AUTONOMOUS TECHNOLOGY & ROBOTICS ETF*',
            ),
          ],
        ),
      ),
    );
  }
}
