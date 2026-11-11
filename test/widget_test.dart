
import 'package:flutter_test/flutter_test.dart';
import 'package:explore_mundo/main.dart';

void main() {
  testWidgets('Verifica a tela inicial da Explore Mundo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ExploreMundoApp());

    expect(find.text('EXPLORE MUNDO'), findsOneWidget);
    expect(find.text('Destinos em destaque'), findsOneWidget);
    expect(find.text('Oeschinen Lake'), findsOneWidget);
  });
}
