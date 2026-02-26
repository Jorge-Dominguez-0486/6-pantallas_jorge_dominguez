import 'package:flutter/material.dart';

class PantallaBienvenida extends StatelessWidget {
  const PantallaBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jorge Dominguez - 6:J', style: TextStyle(fontSize: 14, color: Colors.grey)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ps',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w300, // Fuente más delgada y elegante
                  color: Colors.blue,
                  letterSpacing: -5,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Bienvenido a Ps la\nLibreria cristiana digital\nque necesitabas, descarga y\ncompra libros con facilidad.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              const Text(
                'Solo recuerda iniciar secion\ntocando el icono del perfil en\nla parte superior derecha.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black54),
              ),
              const SizedBox(height: 50),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/inicio');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black45),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Continuar', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}