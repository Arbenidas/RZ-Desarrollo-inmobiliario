import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendEmail() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || _messageController.text.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa los campos requeridos')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://formsubmit.co/ajax/info@rzdesarrollosinmobiliarios.com');
    
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({
          'name': '${_nameController.text} ${_lastNameController.text}',
          'email': _emailController.text,
          'phone': _phoneController.text,
          'message': _messageController.text,
          '_subject': 'Nuevo Contacto Web RZ',
          '_template': 'table', // Optional: nice table format
          '_captcha': 'false',  // Optional: disable captcha if you want
        }),
      );

      if (response.statusCode == 200) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('¡Mensaje enviado con éxito!'),
              backgroundColor: Colors.green,
            ),
          );
          _nameController.clear();
          _lastNameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _messageController.clear();
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al enviar: ${response.body}')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error de conexión. Inténtalo de nuevo.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceDark,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: Container(
           constraints: const BoxConstraints(maxWidth: 1000),
           child: Column(
             children: [
               Text('CONTACTO', 
                 style: AppTextStyles.overline,
                 textAlign: TextAlign.center,
               ),
               const SizedBox(height: 24),
               Text('Inicia tu Proyecto', 
                 style: AppTextStyles.h2.copyWith(color: Colors.white),
                 textAlign: TextAlign.center,
               ),
               const SizedBox(height: 16),
               Text(
                 '¿Estás listo para invertir o construir tu nuevo hogar? Escríbenos.',
                 style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400]),
                 textAlign: TextAlign.center,
               ),
               const SizedBox(height: 60),

               // Form Container
               Container(
                 padding: const EdgeInsets.all(40),
                 decoration: BoxDecoration(
                   color: Colors.black,
                   border: Border.all(color: Colors.white10),
                 ),
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Expanded(child: _CustomTextField(label: 'Nombre', controller: _nameController)),
                         const SizedBox(width: 24),
                         Expanded(child: _CustomTextField(label: 'Apellido', controller: _lastNameController)),
                       ],
                     ),
                     const SizedBox(height: 24),
                     _CustomTextField(label: 'Correo Electrónico', controller: _emailController),
                     const SizedBox(height: 24),
                     _CustomTextField(label: 'Teléfono', controller: _phoneController),
                     const SizedBox(height: 24),
                     _CustomTextField(label: 'Mensaje', maxLines: 4, controller: _messageController),
                     const SizedBox(height: 48),
                     SizedBox(
                       width: double.infinity,
                       child: ElevatedButton(
                          onPressed: _isLoading ? null : _sendEmail,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            disabledBackgroundColor: Colors.grey[800],
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            textStyle: AppTextStyles.button,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          child: _isLoading 
                            ? const SizedBox(
                                height: 20, 
                                width: 20, 
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
                              ) 
                            : const Text('ENVIAR MENSAJE'),
                        ),
                     )
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

class _CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController? controller;

  const _CustomTextField({required this.label, this.maxLines = 1, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.button.copyWith(fontSize: 10, color: Colors.grey[500])),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surfaceDark,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.zero,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.zero,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}
