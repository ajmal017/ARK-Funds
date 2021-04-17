import 'package:arkfundsapp/screens/daily_trade_item.dart';
import 'package:arkfundsapp/screens/daily_trades.dart';
import 'package:arkfundsapp/screens/performance.dart';
import 'package:arkfundsapp/screens/fund_details_screen.dart';
import 'package:arkfundsapp/screens/fund_documents.dart';
import 'package:arkfundsapp/screens/holdings.dart';
import 'package:arkfundsapp/screens/holdings_detail_screen.dart';
import 'package:arkfundsapp/screens/nav_and_market_price_screen.dart';
import 'package:arkfundsapp/screens/premium_discount.dart';

import './screens/bottom_tab_screen.dart';
import './screens/etf_detail_screen.dart';
import './screens/detail_fund_description.dart';

import 'package:flutter/material.dart';

void main() => runApp(ArkFundsLandingPage());

class ArkFundsLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARK - Funds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARK - Funds',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('ARK - Funds'),
      //     actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => BottomTabBar(),
        EtfDetailScreen.routeName: (ctx) => EtfDetailScreen(),
        DetailFundDescription.routeName: (ctx) => DetailFundDescription(),
        FundDetailsScreen.routeName: (ctx) => FundDetailsScreen(),
        NavAndMarketPrice.routeName: (ctx) => NavAndMarketPrice(),
        ArkkPerformance.routeName: (ctx) => ArkkPerformance(),
        Holdings.routeName: (ctx) => Holdings(),
        PremiumDiscount.routeName: (ctx) => PremiumDiscount(),
        FundDocuments.routeName: (ctx) => FundDocuments(),
        HoldingsDetailScreen.routeName: (ctx) => HoldingsDetailScreen(),
        DailyTrades.routeName: (ctx) => DailyTrades(),
        DailyTradeItem.routeName: (ctx) => DailyTradeItem(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => BottomTabBar(),
        );
      },
    );
  }
}
