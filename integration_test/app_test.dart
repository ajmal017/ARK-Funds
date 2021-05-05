import 'package:arkfundsapp/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  testWidgets('verify total market value', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data.startsWith('Total Market Value'),
      ),
      findsOneWidget,
    );
  });
}
