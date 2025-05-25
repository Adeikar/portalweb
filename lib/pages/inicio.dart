import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hola, soy un\nIngeniero de Sistemas",
              style: TextStyle(
                fontSize: isWide ? 42 : 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD4AF37),
              ),
              textAlign: isWide ? TextAlign.left : TextAlign.center,
            ).animate().fadeIn(duration: 1200.ms).slideY(begin: 0.3),
            const SizedBox(height: 16),
            Text(
              "Construyo soluciones digitales con precisión, elegancia y propósito.",
              style: TextStyle(
                fontSize: isWide ? 20 : 16,
                color: Colors.grey[300],
              ),
              textAlign: isWide ? TextAlign.left : TextAlign.center,
            ).animate().fadeIn(duration: 1500.ms),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
