import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/fund_details_provider.dart';
import 'package:arkfundsapp/screens/fund_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test/flutter_test.dart';
import 'dart:async';
import 'package:mockito/mockito.dart';

class MockFundProductGroup extends Mock implements FundProductGroup {}

class MockFundDetailsProvider extends Mock implements FundDetailsProvider {}

FundProductGroup fundProductGroup;
FundDetailsProvider fundDetailsProvider;

List<FundDetailsObject> fundDetailsList = [
  FundDetailsObject(
    id: 1,
    fundDetails: [
      {
        'title': 'text1',
        'detail': 'detail1',
      },
      {
        'title': 'text2',
        'detail': 'detail2',
      },
    ],
  ),
];

void main() {
  setUp(() {
    fundProductGroup = MockFundProductGroup();
    when(fundProductGroup.fetchProducts(1)).thenAnswer((_) => Future.value());
    when(fundProductGroup.groups).thenReturn(fundDetailsList);
  });

  Widget makeTestableWidget({Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FundDetailsProvider()),
      ],
      child: MaterialApp(
        home: child,
      ),
    );
  }

  group("Fund Detail Screen test", () {
    testWidgets("Test Fund Detail Screen Scrolling", (WidgetTester tester) async {
      FundDetailsScreen fdScreen = FundDetailsScreen();
      await tester.pumpWidget(makeTestableWidget(child: fdScreen));
      await tester.pumpAndSettle();

      expect(find.text("text1"), findsOneWidget);
      expect(find.text("text2"), findsOneWidget);
      expect(find.text("detail1"), findsOneWidget);
      expect(find.text("detail2"), findsOneWidget);
    });
  });
}
