import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Servicios extends StatelessWidget {
  const Servicios({super.key});

  final List<Map<String, dynamic>> servicios = const [
    {
      'titulo': 'Desarrollo Web',
      'descripcion': 'Sitios profesionales y aplicaciones web modernas.',
      'icono': Icons.web,
    },
    {
      'titulo': 'Aplicaciones Móviles',
      'descripcion': 'Apps Android/iOS con Flutter, rápidas y accesibles.',
      'icono': Icons.phone_android,
    },
    {
      'titulo': 'IA y Machine Learning',
      'descripcion': 'Sistemas inteligentes con Python, modelos de predicción y análisis.',
      'icono': Icons.memory,
    },
    {
      'titulo': 'Análisis de Datos',
      'descripcion': 'Dashboards, reportes automáticos y visualizaciones estratégicas.',
      'icono': Icons.analytics,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🛠️ Servicios',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Descubre cómo puedo ayudarte a transformar tus ideas en soluciones funcionales:',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: servicios
                    .map((s) => _buildServiceCard(s, isWide))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> s, bool isWide) {
    return Container(
      width: isWide ? 300 : double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD4AF37), width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            s['icono'],
            size: 36,
            color: const Color(0xFFD4AF37),
          ),
          const SizedBox(height: 12),
          Text(
            s['titulo'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4AF37),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s['descripcion'],
            style: const TextStyle(
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
    );
  }
}
