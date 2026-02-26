import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // RUTA DE IMPORTACIÓN CORRECTA

void main() {
  testWidgets('Verifica que la pantalla de bienvenida se muestra correctamente', (WidgetTester tester) async {
    // Construye la aplicación con la clase correcta: LibreriaCristianaApp
    await tester.pumpWidget(const LibreriaCristianaApp());

    // Verifica que el texto 'Librería Cristiana' está presente en la pantalla de bienvenida.
    expect(find.text('Librería Cristiana'), findsOneWidget);

    // Verifica que el botón 'Empezar' está presente.
    expect(find.widgetWithText(ElevatedButton, 'Empezar'), findsOneWidget);
  });
}
