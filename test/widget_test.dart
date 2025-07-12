import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_estado_bloc/main.dart';

void main() {
  testWidgets('Deve exibir botão de login e carregar usuário', (WidgetTester tester) async {
    // Constrói o app
    await tester.pumpWidget(MaterialApp(home: MyAppBloc()));

    // Verifica se o botão "Login" está visível
    expect(find.text('Login'), findsOneWidget);

    // Toca no botão "Login"
    await tester.tap(find.text('Login'));

    // Espera pelo próximo frame e pela animação do loading
    await tester.pump(); // inicia loading
    await tester.pump(const Duration(seconds: 1)); // simula delay

    // Verifica se o nome e ID do usuário carregaram
    expect(find.text('Id Usuário: 123'), findsOneWidget);
    expect(find.text('Nome: Julia'), findsOneWidget);
  });
}
