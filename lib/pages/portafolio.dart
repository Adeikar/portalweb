import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Portafolio extends StatelessWidget {
  const Portafolio({super.key});

  final List<Map<String, String>> proyectos = const [
    {
      'titulo': 'Portal Web',
      'descripcion': 'Plataforma web para la presentación profesional de proyectos, servicios y perfiles técnicos.',
      'tecnologias': 'Python, Flutter',
      'link': 'https://github.com/Adeikar/portalweb'
    },
    {
      'titulo': 'Guardería Infantil',
      'descripcion': 'Sitio web informativo para una guardería, diseñado para comunicar servicios, horarios y valores institucionales.',
      'tecnologias': 'HTML, CSS, JavaScript',
      'link': 'https://github.com/Adeikar/Guarderia_Infantil'
    },
    {
      'titulo': 'Farmacia 25 de Julio',
      'descripcion': 'Sistema integral para farmacias con módulos de gestión de inventario, ventas, usuarios y generación de reportes.',
      'tecnologias': 'MySQL, Node.js, Express, CSS, JavaScript',
      'link': 'https://github.com/innovatesolutionstudio/Farmacia'
    },
    {
      'titulo': 'Biblioteca Virtual',
      'descripcion': 'Microservicio para el análisis y visualización interactiva de datos históricos de Bolivia en tiempo real.',
      'tecnologias': 'Python, PHP, Node.js, Flask, Chart.js, Firebase, MySQL',
      'link': 'https://github.com/innovatesolutionstudio/Biblioteca_Virtual'
    },
    {
      'titulo': 'Juego de Memoria',
      'descripcion': 'Videojuego interactivo desarrollado en Unity para estimular la memoria y la concentración en niños y jóvenes.',
      'tecnologias': 'C#, Unity, Firebase',
      'link': 'https://github.com/Adeikar/Juego_2.1'
    },
    {
      'titulo': 'Automatización de Farmacia',
      'descripcion': 'Microservicio de simulación y análisis para visualizar el funcionamiento operativo de una farmacia en tiempo real.',
      'tecnologias': 'Python, Flask, Chart.js',
      'link': 'https://github.com/innovatesolutionstudio/Automatizacion_Farmacia'
    }
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
                '💼 Portafolio de Proyectos',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Explora algunos de los proyectos que he desarrollado:',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 28),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
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
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD4AF37),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            proyecto['descripcion'] ?? '',
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 10),
          Text(
            "🛠️ Tecnologías: ${proyecto['tecnologias']}",
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                final url = proyecto['link']!;
                launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              },
              icon: const Icon(Icons.open_in_new, size: 16, color: Color(0xFFD4AF37)),
              label: const Text(
                'Ver proyecto',
                style: TextStyle(color: Color(0xFFD4AF37)),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
