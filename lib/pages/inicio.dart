import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/widgets/responsive_layout.dart';

class InicioPage extends StatelessWidget {
  final Function(String) onSectionSelected;
  const InicioPage({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Stack(
      children: [
        // Fondo de partículas simples
        Positioned.fill(
          child: CustomPaint(
            painter: _ParticlePainter(),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '¡Bienvenido a Karcito.dev!',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.3),

                  const SizedBox(height: 16),

                  Text(
                    'Desarrollador Full-Stack | Especialista en Flutter y Python',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      color: const Color(0xFFB0B0B0),
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 1200.ms),

                  const SizedBox(height: 32),

                  ElevatedButton(
                    onPressed: () {
                      onSectionSelected('Portafolio');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Descubre mis proyectos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ).animate().fadeIn(duration: 1400.ms).scale(),

                  const SizedBox(height: 48),

                  // ✅ CORREGIDO: ahora incluye tablet también
                  ResponsiveLayout(
                    mobile: Column(
                      children: [
                        _buildCounter('10+', 'Proyectos'),
                        const SizedBox(height: 16),
                        _buildCounter('3', 'Años de experiencia'),
                        const SizedBox(height: 16),
                        _buildCounter('5+', 'Tecnologías dominadas'),
                      ],
                    ),
                    tablet: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCounter('5+', 'Proyectos'),
                        _buildCounter('3', 'Años de experiencia'),
                        _buildCounter('5+', 'Tecnologías dominadas'),
                      ],
                    ),
                    desktop: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCounter('5+', 'Proyectos'),
                        _buildCounter('3', 'Años de experiencia'),
                        _buildCounter('5+', 'Tecnologías dominadas'),
                      ],
                    ),
                  ).animate().fadeIn(duration: 1600.ms),

                  const SizedBox(height: 48),

                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white10,
                      border: Border.all(color: const Color(0xFFD4AF37)),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          '“Un profesional que entrega soluciones sólidas y elegantes.”',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '— Karcito',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 1800.ms).slideY(begin: 0.2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCounter(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

class _ParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;
    for (int i = 0; i < 20; i++) {
      final x = size.width * (i / 20);
      final y = size.height * ((i * 3 % 20) / 20);
      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
