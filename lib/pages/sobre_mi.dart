import 'package:flutter/material.dart';
import '../responsive.dart';
import '/widgets/responsive_layout.dart';

class SobreMi extends StatelessWidget {
  const SobreMi({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _contenidoMobile(),
      tablet: _contenidoTablet(),
      desktop: _contenidoDesktop(),
    );
  }

  Widget _contenidoMobile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
          ),
          SizedBox(height: 16),
          Text("Juan Pérez", style: TextStyle(fontSize: 22, color: Color(0xFFD4AF37))),
          Text("Ingeniero de Sistemas", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 16),
          Text(
            "Biografía profesional resumida para móviles...",
            style: TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _contenidoTablet() {
    return _contenidoDesktop(padding: 32, fontSize: 15);
  }

  Widget _contenidoDesktop({double padding = 48, double fontSize = 16}) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(radius: 60, backgroundColor: Colors.grey),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Juan Pérez",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37)),
                    ),
                    const SizedBox(height: 4),
                    const Text("Ingeniero de Sistemas", style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 16),
                    Text(
                      "Biografía profesional con más espacio y texto para escritorio.",
                      style: TextStyle(fontSize: fontSize, color: Colors.white70),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
