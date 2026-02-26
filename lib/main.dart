import 'package:flutter/material.dart';
import 'pantalla_bienvenida.dart';
import 'pantalla_inicio.dart';
import 'pantalla_login.dart';
import 'pantalla_registro.dart';
// Nuevas pantallas importadas:
import 'pantalla_biblioteca.dart';
import 'pantalla_tienda.dart';
import 'pantalla_buscar.dart';

void main() {
  runApp(const LibreriaCristianaApp());
}

class LibreriaCristianaApp extends StatelessWidget {
  const LibreriaCristianaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Librería Cristiana PS',
      theme: ThemeData(
        fontFamily: 'Helvetica', 
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaBienvenida(),
        '/inicio': (context) => const PantallaInicio(),
        '/login': (context) => const PantallaLogin(),
        '/registro': (context) => const PantallaRegistro(),
        '/biblioteca': (context) => const PantallaBiblioteca(),
        '/tienda': (context) => const PantallaTienda(),
        '/buscar': (context) => const PantallaBuscar(),
      },
    );
  }
}