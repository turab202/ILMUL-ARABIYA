import 'package:flutter_test/flutter_test.dart';
import 'package:ilmularabiya/src/app.dart';

void main() {
  testWidgets('App starts and displays', (WidgetTester tester) async {
    await tester.pumpWidget(const IlmulArabiyaApp());
    expect(find.byType(IlmulArabiyaApp), findsOneWidget);
  });
}
