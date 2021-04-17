import 'package:arkfundsapp/screens/daily_trades.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Introduction extends StatelessWidget {
  final double flexInput;
  Introduction(this.flexInput);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: flexInput,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xff1b7da7)),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${DateFormat.yMMMd().format(DateTime.now()).toString()}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            Text(
              'Total Market Value',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '\$49.954 B',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              '\u25B2 \$1.457 B',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(DailyTrades.routeName),
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  bottom: 5,
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Color(0xFF6CBABD),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Text(
                      'Daily Trades',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white60,
                          ),
                          onPressed: null,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
