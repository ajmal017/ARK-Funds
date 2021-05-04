import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/fundDocuments_provider.dart';
import 'package:arkfundsapp/providers/fund_details_provider.dart';
import 'package:arkfundsapp/providers/fund_total_market_value.dart';
import 'package:arkfundsapp/providers/holdings_provider.dart';
import 'package:arkfundsapp/providers/marketPrice_chartProvider.dart';
import 'package:arkfundsapp/providers/navMarketPrice_provider.dart';
import 'package:arkfundsapp/providers/navPrice_chartProvider.dart';
import 'package:arkfundsapp/providers/performance_provider.dart';

import './providers/fund_groups.dart';
import './screens/daily_trade_item.dart';
import './screens/daily_trades.dart';
import './screens/fund_group_screen.dart';
import './screens/performance.dart';
import './screens/fund_details_screen.dart';
import './screens/fund_documents.dart';
import './screens/holdings.dart';
import './screens/holdings_detail_screen.dart';
import './screens/nav_and_market_price_screen.dart';
import './screens/premium_discount.dart';
import './screens/bottom_tab_screen.dart';
import './screens/etf_detail_screen.dart';
import './screens/detail_fund_description.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FundGroups()),
        ChangeNotifierProvider(create: (context) => FundProductGroup()),
        ChangeNotifierProvider(create: (context) => FundTotalMarketValue()),
        ChangeNotifierProvider(create: (context) => FundDetailsProvider()),
        ChangeNotifierProvider(create: (context) => NavMarketPriceProvider()),
        ChangeNotifierProvider(create: (context) => PerformanceProvider()),
        ChangeNotifierProvider(create: (context) => HoldingsProvider()),
        ChangeNotifierProvider(create: (context) => NavPriceChartProvider()),
        ChangeNotifierProvider(create: (context) => MarketPriceChartProvider()),
        ChangeNotifierProvider(create: (context) => FundDocumentsProvider()),
      ],
      child: MaterialApp(
        title: 'ARK - Funds',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: 'SF-Pro-Display',
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => FundGroupsScreen(),
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
      ),
    );
  }
}
