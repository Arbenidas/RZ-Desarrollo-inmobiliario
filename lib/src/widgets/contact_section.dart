import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
               Text('CONTACTO', style: AppTextStyles.overline),
               const SizedBox(height: 24),
               Text('Inicia tu Proyecto', style: AppTextStyles.h2.copyWith(color: Colors.white)),
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
                         Expanded(child: _CustomTextField(label: 'Nombre')),
                         const SizedBox(width: 24),
                         Expanded(child: _CustomTextField(label: 'Apellido')),
                       ],
                     ),
                     const SizedBox(height: 24),
                     _CustomTextField(label: 'Correo Electrónico'),
                     const SizedBox(height: 24),
                     _CustomTextField(label: 'Teléfono'),
                     const SizedBox(height: 24),
                     _CustomTextField(label: 'Mensaje', maxLines: 4),
                     const SizedBox(height: 48),
                     SizedBox(
                       width: double.infinity,
                       child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            textStyle: AppTextStyles.button,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          child: const Text('ENVIAR MENSAJE'),
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

  const _CustomTextField({required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.button.copyWith(fontSize: 10, color: Colors.grey[500])),
        const SizedBox(height: 8),
        TextField(
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
