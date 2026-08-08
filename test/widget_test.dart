import 'package:flutter_test/flutter_test.dart';
import 'package:auth_ui_kit/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const AuthUIKitApp());
    expect(find.byType(AuthUIKitApp), findsOneWidget);
  });
}
