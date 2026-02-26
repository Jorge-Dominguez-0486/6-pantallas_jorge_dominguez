import 'package:flutter/material.dart';

class PantallaBuscar extends StatelessWidget {
  const PantallaBuscar({super.key});

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
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 120),
            children: [
              const Text('Buscar', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: -1)),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _crearLibroImagen('https://images.unsplash.com/photo-1588580000645-4562a6d2c839?auto=format&fit=crop&w=200&q=80', 'Parabolas'),
                  _crearLibroImagen('https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=200&q=80', '¿Vives la biblia?'),
                ],
              ),
              const SizedBox(height: 40),
              
              const Text('Para tu crecimiento', style: TextStyle(fontSize: 18, color: Colors.black87)),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Container(
                      width: 80, height: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&w=200&q=80'), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('The Field\nof BOAZ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
                                child: const Text('S/.299'),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(border: Border.all(color: Colors.black45), borderRadius: BorderRadius.circular(15)),
                                child: const Text('Carrito'),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          _construirBarraInferior(context, 'buscar'),
        ],
      ),
    );
  }

  Widget _crearLibroImagen(String urlImagen, String subtitulo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150, height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(urlImagen, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 5),
        Text(subtitulo, style: const TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  Widget _construirBarraInferior(BuildContext context, String activa) {
    if (activa == 'buscar') {
      return Positioned(
        bottom: 30, left: 20, right: 20,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey[350]!),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
          ),
          child: Row(
            children: [
              // Icono de INICIO a la izquierda
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/inicio'),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 10),
                  child: Icon(Icons.home_outlined, color: Colors.grey[600], size: 30),
                ),
              ),
              // Campo de texto para la búsqueda
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Q BOOKS',
                    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 18),
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                ),
              ),
              // Icono de micrófono a la derecha
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 18),
                child: Icon(Icons.mic_none, color: Colors.grey[600], size: 28),
              ),
            ],
          ),
        ),
      );
    }

    return Positioned(
      bottom: 30, left: 20, right: 20,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, 'Inicio', '/inicio', activa),
            _buildNavItem(context, 'Biblioteca', '/biblioteca', activa),
            _buildNavItem(context, 'Tienda', '/tienda', activa),
            _buildNavIcon(context, Icons.search, '/buscar', activa),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route, String active) {
    final bool isActive = title.toLowerCase() == active;
    return GestureDetector(
      onTap: () => !isActive ? Navigator.pushReplacementNamed(context, route) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: isActive ? BoxDecoration(border: Border.all(color: Colors.black45), borderRadius: BorderRadius.circular(20)) : null,
        child: Text(title, style: TextStyle(fontSize: 16, fontWeight: isActive ? FontWeight.bold : FontWeight.normal, color: isActive ? Colors.black : Colors.black54)),
      ),
    );
  }
  
  Widget _buildNavIcon(BuildContext context, IconData icon, String route, String active) {
    final bool isActive = 'buscar' == active;
    return GestureDetector(
      onTap: () => !isActive ? Navigator.pushReplacementNamed(context, route) : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isActive ? Border.all(color: Colors.black45, width: 2) : Border.all(color: Colors.transparent),
        ),
        child: Icon(icon, size: 24, color: isActive ? Colors.black : Colors.black54),
      ),
    );
  }
}
