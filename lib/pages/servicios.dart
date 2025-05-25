import 'package:flutter/material.dart';

class Servicios extends StatelessWidget {
  const Servicios({super.key});

  final List<Map<String, String>> servicios = const [
    {
      'titulo': 'Desarrollo Web',
      'descripcion': 'Sitios profesionales y aplicaciones web modernas.'
    },
    {
      'titulo': 'Aplicaciones Móviles',
      'descripcion': 'Apps Android/iOS con Flutter, rápidas y accesibles.'
    },
    {
      'titulo': 'IA y Machine Learning',
      'descripcion': 'Sistemas inteligentes con Python, modelos de predicción y análisis.'
    },
    {
      'titulo': 'Análisis de Datos',
      'descripcion': 'Dashboards, reportes automáticos y visualizaciones estratégicas.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🛠️ Servicios',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4AF37),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: servicios.map((s) {
              return Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD4AF37), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s['titulo']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4AF37),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      s['descripcion']!,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
