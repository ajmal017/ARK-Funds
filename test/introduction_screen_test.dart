import 'package:arkfundsapp/providers/fund_total_market_value_provider.dart';
import 'package:arkfundsapp/widgets/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockFundTotalMarketValue extends Mock implements FundTotalMarketValue {}

FundTotalMarketValue totalMarketValue;

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => totalMarketValue),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }

  group("Total Market Value Tests", () {
    setUp(() {
      totalMarketValue = MockFundTotalMarketValue();
      when(totalMarketValue.fetchIntro()).thenAnswer((_) => Future.value());
      when(totalMarketValue.date).thenReturn(DateTime.now());
      when(totalMarketValue.currentValue).thenReturn(200000.00);
      when(totalMarketValue.previousValue).thenReturn(100000.00);
    });

    testWidgets("Total Market Value mark up", (WidgetTester tester) async {
      Introduction fgScreen = Introduction(310.0);
      await tester.pumpWidget(makeTestableWidget(child: fgScreen));
      await tester.pumpAndSettle();
      expect(
          find.text(
            DateFormat.yMMMd().format(totalMarketValue.date).toString(),
          ),
          findsOneWidget);

      var expectedStr = '\u25B2' +
          FlutterMoneyFormatter(
            amount:
                totalMarketValue.currentValue - totalMarketValue.previousValue,
          ).output.compactSymbolOnLeft;

      expect(find.text(expectedStr), findsOneWidget);
    });
  });

  group("Total Market Value Tests", () {
    setUp(() {
      totalMarketValue = MockFundTotalMarketValue();
      when(totalMarketValue.fetchIntro()).thenAnswer((_) => Future.value());
      when(totalMarketValue.date).thenReturn(DateTime.now());
      when(totalMarketValue.currentValue).thenReturn(100000.00);
      when(totalMarketValue.previousValue).thenReturn(200000.00);
    });

    testWidgets("Total Market Value mark down", (WidgetTester tester) async {
      Introduction fgScreen = Introduction(310.0);
      await tester.pumpWidget(makeTestableWidget(child: fgScreen));
      await tester.pumpAndSettle();
      expect(
          find.text(
            DateFormat.yMMMd().format(totalMarketValue.date).toString(),
          ),
          findsOneWidget);

      var expectedStr = '\u25BC' +
          FlutterMoneyFormatter(
            amount:
                totalMarketValue.previousValue - totalMarketValue.currentValue,
          ).output.compactSymbolOnLeft;

      expect(find.text(expectedStr), findsOneWidget);
    });
  });
}
