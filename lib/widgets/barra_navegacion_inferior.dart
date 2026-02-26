import 'package:flutter/material.dart';

class BarraNavegacionInferior extends StatefulWidget {
  final String paginaActiva;

  const BarraNavegacionInferior({super.key, required this.paginaActiva});

  @override
  State<BarraNavegacionInferior> createState() => _BarraNavegacionInferiorState();
}

class _BarraNavegacionInferiorState extends State<BarraNavegacionInferior> {
  bool _mostrarCarrito = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 15,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Contenedor para los botones de texto, como estaba originalmente
          Expanded(
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(context, 'Inicio', '/inicio'),
                  _buildNavItem(context, 'Biblioteca', '/biblioteca'),
                  _buildNavItem(context, 'Tienda', '/tienda'),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // 2. Botón de búsqueda circular y separado
          _buildSearchButton(context, '/buscar'),
        ],
      ),
    );
  }

  // REVERTIMOS A LOS BOTONES DE TEXTO ORIGINALES
  Widget _buildNavItem(BuildContext context, String title, String route) {
    final bool isActive = title.toLowerCase() == widget.paginaActiva;

    final navItemContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: isActive
          ? BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(20))
          : null,
      child: Text(title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.black : Colors.black54)),
    );

    final navItem = GestureDetector(
      onTap: () {
        if (!isActive) {
          setState(() {
            _mostrarCarrito = false;
          });
          Navigator.pushReplacementNamed(context, route);
        } else if (title == 'Tienda') {
          setState(() {
            _mostrarCarrito = !_mostrarCarrito;
          });
        }
      },
      child: navItemContent,
    );
    
    if (title == 'Tienda') {
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          navItem,
          if (_mostrarCarrito)
            Positioned(
              top: -15, // Ajustamos la posición para el texto
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                   boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))
                  ],
                ),
                child: const Text('Carrito', style: TextStyle(fontSize: 11, color: Colors.black87)),
              ),
            ),
        ],
      );
    }

    return navItem;
  }
  
  // Botón de búsqueda separado
  Widget _buildSearchButton(BuildContext context, String route) {
    final bool isActive = widget.paginaActiva == 'buscar';
    return GestureDetector(
      onTap: () {
         if (!isActive) {
            setState(() {
              _mostrarCarrito = false;
            });
            Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
           border: isActive ? Border.all(color: Colors.black45, width: 2) : null,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        child: Icon(Icons.search, color: isActive ? Colors.black : Colors.black54, size: 30),
      ),
    );
  }
}
