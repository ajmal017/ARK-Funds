import 'package:arkfundsapp/providers/category.dart';
import 'package:arkfundsapp/providers/fund_details_provider.dart';
import 'package:arkfundsapp/screens/fund_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test/flutter_test.dart';
import 'dart:async';
import 'package:mockito/mockito.dart';

// class MockFundDetailsScreen extends Mock implements FundDetailsScreen {}
class MockFundProductGroup extends Mock implements FundProductGroup {}

class MockFundDetailsProvider extends Mock implements FundDetailsProvider {}

FundProductGroup fundProductGroup;
FundDetailsScreen fundDetailsScreen;
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

List groups = [
  [Category(id: 1, title: "1", subtitle: "1-1", amount: 1009999.00)],
  [Category(id: 11, title: "11", subtitle: "11-1", amount: 100087654.00)]
];



void main() {
  setUp(() {
    // fundDetailsScreen = FundDetailsScreen();
    fundProductGroup = MockFundProductGroup();
    when(fundProductGroup.fetchProducts(1)).thenAnswer((_) => Future.value());
    when(fundProductGroup.groups).thenReturn(groups);
    fundDetailsProvider = MockFundDetailsProvider();
    when(fundDetailsProvider.fetchFundDetails(1))
        .thenAnswer((_) => Future.value());
    when(fundDetailsProvider.fundDetails).thenReturn(fundDetailsList);
  });

  Widget makeTestableWidget({Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => fundDetailsProvider),
        ChangeNotifierProvider(
          create: (context) => fundProductGroup,
        ),
      ],
      child: MaterialApp(
        home: child,
      ),
    );
  }

  group("Fund Detail Screen test", () {
    testWidgets("Test Fund Detail Screen Scrolling",
        (WidgetTester tester) async {
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
