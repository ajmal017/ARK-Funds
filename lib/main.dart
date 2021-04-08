import './screens/bottom_tab_screen.dart';
import './screens/etf_detail_screen.dart';
import './screens/label1.dart';
import './screens/detail_fund_description.dart';

import 'package:flutter/material.dart';



void main() => runApp(ArkFundsLandingPage());

class ArkFundsLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARK - Funds',
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
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/':(ctx)=> BottomTabBar(),
        EtfDetailScreen.routeName:(ctx)=>EtfDetailScreen(),
        DetailFundDescription.routeName:(ctx)=>DetailFundDescription(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => LabelOne(),
        );
      },
    );
  }
}
