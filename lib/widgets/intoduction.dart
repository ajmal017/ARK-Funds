import 'package:arkfundsapp/providers/intro.dart';
import 'package:arkfundsapp/screens/daily_trades.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';



class Introduction extends StatefulWidget {
  final double flexInput;
  Introduction(this.flexInput);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Intro>(context);
    return Container(
      height: widget.flexInput,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xFF6951CC)),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${DateFormat.yMMMd().format(data.date).toString()}',
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
              FlutterMoneyFormatter(amount: data.currentValue)
                  .output
                  .compactSymbolOnLeft,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              data.currentValue - data.previousValue > 0
                  ? '\u25B2' +
                      FlutterMoneyFormatter(
                        amount: data.currentValue - data.previousValue,
                      ).output.compactSymbolOnLeft
                  : '\u25BC' +
                      FlutterMoneyFormatter(
                        amount: data.previousValue - data.currentValue,
                      ).output.compactSymbolOnLeft,
              // style: data.currentValue - data.previousValue > 0
              //     ? TextStyle(
              //         fontSize: 14,
              //         color: Colors.green,
              //       )
              //     : TextStyle(
              //         fontSize: 14,
              //         color: Colors.red,
              //       ),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(DailyTrades.routeName),
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  bottom: 5,
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Color(0xFF30169F),
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
