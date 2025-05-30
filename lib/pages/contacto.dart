import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacto extends StatelessWidget {
  const Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerNombre = TextEditingController();
    final controllerCorreo = TextEditingController();
    final controllerMensaje = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '📬 Contáctame',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37),
                ),
              ),
              const SizedBox(height: 32),

              _buildTextField(controllerNombre, 'Nombre'),
              const SizedBox(height: 20),

              _buildTextField(controllerCorreo, 'Correo electrónico'),
              const SizedBox(height: 20),

              _buildTextField(controllerMensaje, 'Mensaje', maxLines: 5),
              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _abrirWhatsApp(),
                      icon: const Icon(Icons.chat),
                      label: const Text('WhatsApp'),
                      style: _botonEstilo(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _abrirLinkedIn(),
                      icon: const Icon(Icons.business),
                      label: const Text('LinkedIn'),
                      style: _botonEstilo(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    final nombre = controllerNombre.text.trim();
                    final correo = controllerCorreo.text.trim();
                    final mensaje = controllerMensaje.text.trim();

                    if (nombre.isEmpty || correo.isEmpty || mensaje.isEmpty) {
                      _mostrarAlerta(context, 'Todos los campos son obligatorios.');
                      return;
                    }

                    if (!_validarCorreo(correo)) {
                      _mostrarAlerta(context, 'Por favor ingresa un correo electrónico válido.');
                      return;
                    }

                    _abrirGmail(nombre, correo, mensaje);
                  },
                  icon: const Icon(Icons.email),
                  label: const Text('Enviar por Gmail'),
                  style: _botonEstilo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD4AF37)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFD4AF37)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFFFD700), width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  ButtonStyle _botonEstilo() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFD4AF37),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  void _mostrarAlerta(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Validación'),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool _validarCorreo(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  void _abrirWhatsApp() async {
    final Uri whatsapp = Uri.parse('https://wa.me/59177775374');
    if (await canLaunchUrl(whatsapp)) {
      await launchUrl(whatsapp, mode: LaunchMode.externalApplication);
    }
  }

  void _abrirLinkedIn() async {
    final Uri linkedIn = Uri.parse('https://www.linkedin.com/in/eikar-ademar-quispe-apaza-1b4a93294/');
    if (await canLaunchUrl(linkedIn)) {
      await launchUrl(linkedIn, mode: LaunchMode.externalApplication);
    }
  }

  void _abrirGmail(String nombre, String correo, String mensaje) async {
    final Uri gmailUrl = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1&to=adeikar699@gmail.com&su=${Uri.encodeComponent("Contacto desde Karcito.dev")}&body=${Uri.encodeComponent("Nombre: $nombre\nCorreo: $correo\n\n$mensaje")}',
    );

    if (await canLaunchUrl(gmailUrl)) {
      await launchUrl(gmailUrl, mode: LaunchMode.externalApplication);
    }
  }
}
