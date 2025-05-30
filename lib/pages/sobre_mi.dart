import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class SobreMi extends StatelessWidget {
  const SobreMi({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sobre Karcito',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),

              const SizedBox(height: 24),

              // Avatar con marco dorado
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFD4AF37), width: 3),
                ),
                padding: const EdgeInsets.all(4),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/perfil.jpg'),
                ),
              ).animate().fadeIn(duration: 1000.ms).scale(),

              const SizedBox(height: 16),

              // Nombre y título
              Text(
                'Eikar Ademar Quispe Apaza',
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Ingeniero en Sistemas | Desarrollador Full Stack',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFFB0B0B0),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '“Construyo soluciones digitales con propósito y precisión.”',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white60,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Redes de contacto
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github, color: Color(0xFFD4AF37)),
                    onPressed: () async {
                      final url = Uri.parse('https://github.com/Adeikar?tab=repositories'); 
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'No se pudo abrir $url';
                      }
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color(0xFFD4AF37),
                    ),
                    onPressed: () async {
                      final url = Uri.parse('https://www.linkedin.com/in/eikar-ademar-quispe-apaza-1b4a93294/');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        throw 'No se pudo abrir el enlace: $url';
                      }
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.email, color: Color(0xFFD4AF37)),
                    onPressed: () async {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'adeikar699@gmail.com',
                      );
                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      } else {
                        debugPrint('No se pudo lanzar el cliente de correo.');
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Biografía extendida
              Text(
                'Mi camino en el mundo del desarrollo comenzó en 2021, cuando empecé a fortalecer mi lógica de programación con C#. Esta base me motivó a explorar nuevas tecnologías y, en 2022, decidí enfocarme en el desarrollo de páginas y sistemas tanto web como móviles. Fue ahí donde descubrí el potencial de lenguajes como HTML, CSS y JavaScript, herramientas que me permitieron construir mis primeras interfaces funcionales y atractivas.\n\n'
                'Uno de mis primeros logros fue desarrollar una página web para una guardería en la ciudad de La Paz. Ese proyecto no solo me dio confianza, sino también experiencia en cómo aplicar conocimientos técnicos a necesidades reales. Poco a poco, comprendí que el desarrollo no solo era escribir código, sino entender problemas, pensar en soluciones y crear experiencias útiles para las personas.\n\n'
                'En ese mismo periodo me introduje al mundo de las bases de datos, trabajando con MySQL y Firebase. Con estas tecnologías, implementé funcionalidades como gestión de usuarios, autenticación, roles administrativos y almacenamiento de datos tanto para sistemas web como móviles. Esta conexión entre el frontend, backend y la base de datos me permitió tener una visión integral del desarrollo de software.\n\n'
                'Con el tiempo, me capacité en Laravel, lo cual me permitió estructurar y escalar proyectos más complejos usando PHP. Gracias a este framework, pude desarrollar sistemas web con una arquitectura más robusta y segura.\n\n'
                'Por otro lado, quise mantenerme actualizado en el desarrollo móvil. Fue así que aprendí Kotlin utilizando IntelliJ IDEA, y creé desde juegos simples hasta una aplicación de gestión de usuarios. Esto me abrió el panorama a nuevas formas de crear soluciones portables y dinámicas.\n\n'
                'En 2024 asumí uno de los retos más importantes de mi formación: trabajar con Node.js y tecnologías modernas en equipo. Juntos desarrollamos un sistema completo de gestión y administración de stock para la Farmacia 25 de Julio, donde destacamos la integración de un chatbot con inteligencia artificial para asistir a los usuarios en tiempo real. Esta experiencia fortaleció mis habilidades de trabajo en equipo, resolución de problemas y uso de IA en proyectos reales.\n\n'
                'Actualmente, en 2025, estoy enfocado en aprender Flutter y profundizar mis conocimientos en Python. Estoy desarrollando una aplicación multiplataforma inclusiva, orientada a personas con discapacidad cognitiva, con el apoyo de una institución que cree en el impacto social de la tecnología. Este proyecto utiliza Firebase como base de datos en tiempo real y busca ser una herramienta accesible, educativa y transformadora.\n\n'
                'Además de programar, disfruto proponer ideas, resolver problemas y seguir aprendiendo constantemente. Cada línea de código que escribo no solo busca funcionar, sino también aportar un granito de arena al bienestar de los demás.\n\n'
                '“En los momentos de aburrimiento nacen las ideas más creativas para resolver los problemas más importantes.”\n— karcito',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFFB0B0B0),
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ).animate().fadeIn(duration: 1200.ms),

              const SizedBox(height: 32),

              // Formación y enfoque actual
              Text(
                '🎓 Formación: Universidad Pública de El Alto (UPEA), cursos avanzados en Laravel, Firebase y Flutter.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '🔍 Enfoque actual: Desarrollo de apps inclusivas con Flutter, bases de datos en tiempo real y soluciones accesibles.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '💡 Soft skills: trabajo en equipo, liderazgo, pensamiento crítico, empatía, resolución de problemas.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),

              const SizedBox(height: 32),

              // Habilidades en chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: _buildSkillChips(),
              ).animate().fadeIn(duration: 1400.ms).slideY(begin: 0.1),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSkillChips() {
    final skills = [
      'Flutter',
      'Python',
      'FastAPI',
      'Firebase',
      'MySQL',
      'Git',
      'Responsive UI',
      'Clean Code',
      'Laravel',
      'Node.js',
      'Kotlin',
      'Teamwork',
    ];

    return skills
        .map(
          (skill) => Chip(
            label: Text(skill),
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide(color: Color(0xFFD4AF37))),
            labelStyle: const TextStyle(color: Colors.white),
          ),
        )
        .toList();
  }
}