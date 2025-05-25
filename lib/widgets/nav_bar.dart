import 'package:flutter/material.dart';
import '../responsive.dart'; // asegúrate de tener este archivo

class NavBar extends StatelessWidget {
  final Function(String) onSectionSelected;

  const NavBar({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final isMobileView = isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bienvenido a Karcito.dev',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isMobileView)
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            )
          else
            Row(
              children: [
                _buildNavItem('Inicio'),
                _buildNavItem('Sobre mí'),
                _buildNavItem('Portafolio'),
                _buildNavItem('Servicios'),
                _buildNavItem('Contacto'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label) {
    return TextButton(
      onPressed: () => onSectionSelected(label),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
