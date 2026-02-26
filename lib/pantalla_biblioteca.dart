import 'package:flutter/material.dart';
import 'package:myapp/widgets/barra_navegacion_inferior.dart';

class PantallaBiblioteca extends StatelessWidget {
  const PantallaBiblioteca({super.key});

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
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20.0, bottom: 120),
            children: [
              // --- Título y botón Editar --- 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Biblioteca', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: -1)),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.black54, size: 30),
                    onPressed: () { /* Lógica para editar */ },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- Sección de Libros con URLs ESTABLES ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _crearLibro(
                    // URL REEMPLAZADA POR UNA ESTABLE
                    'https://images.unsplash.com/photo-1592496431122-2349e0fbc666?auto=format&fit=crop&w=400&q=80',
                  ),
                  const SizedBox(width: 20),
                  _crearLibro(
                    // URL REEMPLAZADA POR UNA ESTABLE
                    'https://images.unsplash.com/photo-1612969308146-066d55f37ccb?auto=format&fit=crop&w=400&q=80',
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // --- Sección de Audio Libro con URL ESTABLE ---
              const Text('Audio Libro', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, letterSpacing: -0.5)),
              const SizedBox(height: 15),
              _crearLibro(
                // URL REEMPLAZADA POR UNA ESTABLE
                'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=400&q=80',
                ancho: 150,
                alto: 220,
              ),
            ],
          ),
          // --- Barra de Navegación --- 
          const BarraNavegacionInferior(paginaActiva: 'biblioteca'),
        ],
      ),
    );
  }

  // Widget auxiliar para crear las portadas de los libros
  Widget _crearLibro(String urlImagen, {double ancho = 150, double alto = 200}) {
    return Container(
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          urlImagen,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black54));
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
        ),
      ),
    );
  }
}
