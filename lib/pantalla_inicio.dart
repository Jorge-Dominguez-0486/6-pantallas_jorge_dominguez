import 'package:flutter/material.dart';
import 'package:myapp/widgets/barra_navegacion_inferior.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jorge Dominguez - 6:J', style: TextStyle(fontSize: 14, color: Colors.grey)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, size: 30, color: Colors.black87),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 120),
            children: [
              const Text(
                'Inicio',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: -1),
              ),
              const SizedBox(height: 30),
              const Text('Gratis y en oferta >', style: TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _crearLibroImagen('https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=200&q=80'),
                    _crearLibroImagen('https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=200&q=80'),
                    _crearLibroImagen('https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&w=200&q=80'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text('Los más vendidos\ndel momento >', style: TextStyle(fontSize: 18, color: Colors.black54, height: 1.2)),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _crearLibroImagen('https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&w=200&q=80'),
                    _crearLibroImagen('https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=200&q=80'),
                    _crearLibroImagen('https://images.unsplash.com/photo-1588580000645-4562a6d2c839?auto=format&fit=crop&w=200&q=80'),
                  ],
                ),
              ),
            ],
          ),
          // USAMOS EL WIDGET CENTRALIZADO
          const BarraNavegacionInferior(paginaActiva: 'inicio'),
        ],
      ),
    );
  }

  Widget _crearLibroImagen(String urlImagen) {
    return Container(
      width: 110,
      height: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          urlImagen,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator(strokeWidth: 2));
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}
