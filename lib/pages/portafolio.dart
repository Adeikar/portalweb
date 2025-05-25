import 'package:flutter/material.dart';

class Portafolio extends StatelessWidget {
  const Portafolio({super.key});

  final List<Map<String, String>> proyectos = const [
    {
      'titulo': 'Sistema de Biblioteca Virtual',
      'descripcion': 'Sistema completo para gestionar libros, usuarios y préstamos en línea.',
      'tecnologias': 'Flutter, Node.js, MySQL',
      'link': 'https://github.com/usuario/biblioteca'
    },
    {
      'titulo': 'Dashboard de Indicadores',
      'descripcion': 'Microservicio para análisis y visualización de datos en tiempo real.',
      'tecnologias': 'Python, Flask, Chart.js',
      'link': 'https://github.com/usuario/dashboard'
    },
    {
      'titulo': 'App de Aprendizaje con IA',
      'descripcion': 'App móvil para estudiantes con discapacidad cognitiva usando Q-Learning y audio.',
      'tecnologias': 'Flutter, Firebase, Python',
      'link': 'https://github.com/usuario/app-ia'
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
                '💼 Portafolio',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: proyectos.map((p) => _buildCard(p, isWide)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> proyecto, bool isWide) {
    return Container(
      width: isWide ? 300 : double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD4AF37), width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            proyecto['titulo'] ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4AF37),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            proyecto['descripcion'] ?? '',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            "Tecnologías: ${proyecto['tecnologias']}",
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Aquí se podría usar launchUrl si deseas abrir enlaces
              },
              child: const Text(
                'Ver proyecto',
                style: TextStyle(color: Color(0xFFD4AF37)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
