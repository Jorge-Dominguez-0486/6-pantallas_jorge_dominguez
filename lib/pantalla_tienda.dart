import 'package:flutter/material.dart';
import 'package:myapp/widgets/barra_navegacion_inferior.dart';

class PantallaTienda extends StatelessWidget {
  const PantallaTienda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jorge Dominguez - 6:J', style: TextStyle(fontSize: 14, color: Colors.grey)),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 120),
            children: [
              const Text('Tienda', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: -1)),
              const SizedBox(height: 30),
              const Text('Libros nuevos', style: TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 15),
              _crearCardImagen(
                'Nuevos\nlanzamientos', // Corregido: newline
                'https://images.unsplash.com/photo-1592496431122-2349e0fbc666?auto=format&fit=crop&w=800&q=80',
              ),
              const SizedBox(height: 30),
              const Text('Libros por \$75 o menos', style: TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 15),
              _crearCardImagen(
                '\$75\nFicción', // Corregido: newline
                'https://images.unsplash.com/photo-1524995767962-b1d75e24a151?auto=format&fit=crop&w=800&q=80',
              ),
              const SizedBox(height: 30),
            ],
          ),
          const BarraNavegacionInferior(paginaActiva: 'tienda'),
        ],
      ),
    );
  }

  Widget _crearCardImagen(String texto, String urlImagen) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(urlImagen),
            fit: BoxFit.cover,
            // Corregido: `withOpacity` obsoleto
            colorFilter: ColorFilter.mode(Colors.black.withAlpha(77), BlendMode.darken),
          ),
        ),
        child: Center(
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, height: 1.3),
          ),
        ),
      ),
    );
  }
}
