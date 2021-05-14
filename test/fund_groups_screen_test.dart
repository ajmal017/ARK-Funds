import 'dart:async';

import 'package:arkfundsapp/providers/fund_groups_provider.dart';
import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:arkfundsapp/providers/fund_total_market_value_provider.dart';
import 'package:arkfundsapp/screens/etf_detail_screen.dart';
import 'package:arkfundsapp/screens/fund_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockFundGroups extends Mock implements FundGroups {}

class MockFundTotalMarketValue extends Mock implements FundTotalMarketValue {}

class MockFundProductGroup extends Mock implements FundProductGroup {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

FundGroups fundGroups;
FundTotalMarketValue totalMarketValue;
FundProductGroup fundProductGroup;
NavigatorObserver navigatorObserver;

List<Funds> fundsList = [
  Funds(1, "test", "testd"),
  Funds(2, "test2", "testd2")
];
List groups = [
  [Category(id: 1, title: "1", subtitle: "1-1", amount: 1009999.00)],
  [Category(id: 11, title: "11", subtitle: "11-1", amount: 100087654.00)]
];

void main() {
  setUp(() {
    fundGroups = MockFundGroups();
    when(fundGroups.fetchFunds()).thenAnswer((_) => Future.value());
    when(fundGroups.funds).thenReturn(fundsList);

    totalMarketValue = MockFundTotalMarketValue();
    when(totalMarketValue.fetchIntro()).thenAnswer((_) => Future.value());
    when(totalMarketValue.date).thenReturn(DateTime.now());
    when(totalMarketValue.currentValue).thenReturn(200000.00);
    when(totalMarketValue.previousValue).thenReturn(100000.00);

    fundProductGroup = MockFundProductGroup();
    when(fundProductGroup.fetchProducts(1)).thenAnswer((_) => Future.value());
    when(fundProductGroup.groups).thenReturn(groups);

    navigatorObserver = MockNavigatorObserver();
  });

  Widget makeTestableWidget({Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => fundGroups,
        ),
        ChangeNotifierProvider(
          create: (context) => totalMarketValue,
        ),
        ChangeNotifierProvider(
          create: (context) => fundProductGroup,
        ),
      ],
      child: MaterialApp(
        home: child,
        navigatorObservers: [navigatorObserver],
        routes: {
          EtfDetailScreen.routeName: (ctx) => EtfDetailScreen(),
        },
      ),
    );
  }

  group("Funds Group screen", () {
    testWidgets("Test Top Section", (WidgetTester tester) async {
      FundGroupsScreen fgScreen = FundGroupsScreen();
      await tester.pumpWidget(makeTestableWidget(child: fgScreen));
      await tester.pumpAndSettle();
      expect(
          find.text(
            DateFormat.yMMMd().format(totalMarketValue.date).toString(),
          ),
          findsOneWidget);
      var expectedStr = '';
      if (totalMarketValue.currentValue - totalMarketValue.previousValue > 0) {
        expectedStr = '\u25B2' +
            FlutterMoneyFormatter(
              amount: totalMarketValue.currentValue -
                  totalMarketValue.previousValue,
            ).output.compactSymbolOnLeft;
      } else {
        expectedStr = '\u25BC' +
            FlutterMoneyFormatter(
              amount: totalMarketValue.previousValue -
                  totalMarketValue.currentValue,
            ).output.compactSymbolOnLeft;
      }
      expect(find.text(expectedStr), findsOneWidget);
    });

    testWidgets("Test Fund Groups", (WidgetTester tester) async {
      FundGroupsScreen fgScreen = FundGroupsScreen();
      await tester.pumpWidget(makeTestableWidget(child: fgScreen));
      await tester.pumpAndSettle();

      expect(find.text("test"), findsOneWidget);
      expect(find.text("testd"), findsOneWidget);
      expect(find.text("test2"), findsOneWidget);
      expect(find.text("testd2"), findsOneWidget);

      expect(find.text("1"), findsOneWidget);
      expect(find.text("1-1"), findsOneWidget);

      expect(find.text("11"), findsOneWidget);
      expect(find.text("11-1"), findsOneWidget);

      expect(
        find.text(FlutterMoneyFormatter(
          amount: 1009999.00,
        ).output.compactSymbolOnLeft),
        findsOneWidget,
      );

      expect(
        find.text(FlutterMoneyFormatter(
          amount: 100087654.00,
        ).output.compactSymbolOnLeft),
        findsOneWidget,
      );
    });

    testWidgets("Test Fund Details Navigation", (WidgetTester tester) async {
      FundGroupsScreen fgScreen = FundGroupsScreen();
      await tester.pumpWidget(makeTestableWidget(child: fgScreen));
      await tester.pumpAndSettle();
      var firstElement = find.byType(InkWell).at(1);
      await tester.tap(firstElement);

      await tester.pumpAndSettle();
      verify(navigatorObserver.didPush(any, any));
      expect(find.byType(EtfDetailScreen), findsOneWidget);
    });
  });
}
