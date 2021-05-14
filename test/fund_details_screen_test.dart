import 'package:arkfundsapp/providers/fund_details_provider.dart';
import 'package:arkfundsapp/providers/fund_product_group_provider.dart';
import 'package:arkfundsapp/screens/fund_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockFundDetailsProvider extends Mock implements FundDetailsProvider {}

class MockFundProductGroup extends Mock implements FundProductGroup {}

FundDetailsProvider fundDetailsProvider;
FundProductGroup fundProductGroup;

List groups = [
  [Category(id: 1, title: "1", subtitle: "1-1", amount: 1009999.00)],
  [Category(id: 11, title: "11", subtitle: "11-1", amount: 100087654.00)]
];

List<FundDetailsObject> fundDetails = [
  FundDetailsObject(
    id: 1,
    fundDetails: [
      {
        "title": "title1",
        "detail": "detail1",
      },
      {
        "title": "title11",
        "detail": "detail12",
      },
    ],
  ),
  FundDetailsObject(
    id: 2,
    fundDetails: [
      {
        "title": "title2",
        "detail": "detail2",
      },
      {
        "title": "title21",
        "detail": "detail22",
      },
    ],
  )
];

Map<String, dynamic> routeData = {
  "listItem": Category(id: 1, title: "1", subtitle: "1-1", amount: 1009999.00),
  "title": "Fund Details",
};

void main() {
  setUp(() {
    fundProductGroup = MockFundProductGroup();
    when(fundProductGroup.fetchProducts(1)).thenAnswer((_) => Future.value());
    when(fundProductGroup.groups).thenReturn(groups);

    fundDetailsProvider = MockFundDetailsProvider();
    when(fundDetailsProvider.fetchFundDetails(1))
        .thenAnswer((_) => Future.value());
    when(fundDetailsProvider.fundDetails).thenReturn(fundDetails);
  });

  Widget makeTestableWidget({Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => fundDetailsProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => fundProductGroup,
        ),
      ],
      child: MaterialApp(
        home: Navigator(
          onGenerateRoute: (_) {
            return MaterialPageRoute(
              builder: (_) => child,
              settings: RouteSettings(arguments: routeData),
            );
          },
        ),
      ),
    );
  }

  group("Fund Details Screen", () {
    testWidgets("Fund Details", (WidgetTester tester) async {
      FundDetailsScreen fundDetailsScreen = FundDetailsScreen();
      await tester.pumpWidget(makeTestableWidget(child: fundDetailsScreen));
      await tester.pumpAndSettle();

      expect(find.text("Fund Details"), findsOneWidget);

      expect(find.text("title1"), findsOneWidget);
      expect(find.text("detail1"), findsOneWidget);
      expect(find.text("title11"), findsOneWidget);
      expect(find.text("detail12"), findsOneWidget);
    });
  });
}
