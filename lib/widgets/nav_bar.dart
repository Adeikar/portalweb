import 'package:flutter/material.dart';
import '../responsive.dart';

class NavBar extends StatelessWidget {
  final Function(String) onSectionSelected;
  final String currentSection;

  const NavBar({
    super.key,
    required this.onSectionSelected,
    required this.currentSection,
  });

  @override
  Widget build(BuildContext context) {
    final isMobileView = isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.92),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Karcito.dev',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
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
    final isActive = label == currentSection;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onSectionSelected(label),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isActive ? const Color(0xFFD4AF37) : Colors.white,
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isActive ? 28 : 0,
                color: const Color(0xFFD4AF37),
              )
            ],
          ),
        ),
      ),
    );
  }
}
