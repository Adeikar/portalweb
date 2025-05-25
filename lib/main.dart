import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive.dart'; // ← asegúrate que existe
import 'pages/inicio.dart';
import 'pages/sobre_mi.dart';
import 'pages/portafolio.dart';
import 'pages/servicios.dart';
import 'pages/contacto.dart';
import 'widgets/nav_bar.dart';

void main() {
  runApp(const PortafolioApp());
}

class PortafolioApp extends StatelessWidget {
  const PortafolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karcito.dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeWrapper(),
    );
  }
}

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  String _currentSection = 'Inicio';

  Widget _getSectionWidget() {
    switch (_currentSection) {
      case 'Sobre mí':
        return const SobreMi();
      case 'Portafolio':
        return const Portafolio();
      case 'Servicios':
        return const Servicios();
      case 'Contacto':
        return const Contacto();
      default:
        return const InicioPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Scaffold(
      endDrawer: mobile ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black87),
              child: const Text(
                'Karcito.dev',
                style: TextStyle(color: Color(0xFFD4AF37), fontSize: 24),
              ),
            ),
            _drawerItem('Inicio'),
            _drawerItem('Sobre mí'),
            _drawerItem('Portafolio'),
            _drawerItem('Servicios'),
            _drawerItem('Contacto'),
          ],
        ),
      ) : null,
      body: Column(
        children: [
          NavBar(onSectionSelected: (section) {
            setState(() {
              _currentSection = section;
            });
          }),
          Expanded(child: _getSectionWidget()),
        ],
      ),
    );
  }

  Widget _drawerItem(String label) {
    return ListTile(
      title: Text(label),
      onTap: () {
        Navigator.pop(context); // cerrar el drawer
        setState(() {
          _currentSection = label;
        });
      },
    );
  }
}
