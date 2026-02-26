import 'package:flutter/material.dart';

class PantallaLogin extends StatelessWidget {
  const PantallaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jorge Dominguez - 6:J', style: TextStyle(fontSize: 14, color: Colors.grey)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // Usamos un ListView para asegurar que todo se renderice y sea desplazable
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        children: [
          const SizedBox(height: 50), // Espacio superior
          const Text(
            'Inicio de\ncesion',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300, height: 1.2),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black45, width: 1.5),
            ),
            child: const Icon(Icons.person_outline, size: 80, color: Colors.black45),
          ),
          const SizedBox(height: 50),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Correo:',
              labelStyle: TextStyle(color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña:',
              labelStyle: TextStyle(color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // ESTE ES EL BOTÓN QUE FALTABA
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/inicio', (route) => false);
            },
            child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/registro');
            },
            child: const Text(
              'No tienes cuenta?\nRegistrate.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black87, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 40), // Espacio inferior
        ],
      ),
    );
  }
}
