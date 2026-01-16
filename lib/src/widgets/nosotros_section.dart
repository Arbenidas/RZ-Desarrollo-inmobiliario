import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class NosotrosSection extends StatelessWidget {
  const NosotrosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      child: Center(
         child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                 final isDesktop = constraints.maxWidth > 900;
                 return isDesktop ? _buildDesktop(context) : _buildMobile(context);
              },
            ),
         ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      children: [
        // Image Side
        Expanded(
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                 height: 500,
                 decoration: BoxDecoration(
                   image: const DecorationImage(
                     image: NetworkImage('https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80'),
                     fit: BoxFit.cover,
                   ),
                   borderRadius: BorderRadius.circular(2),
                 ),
              ),
              Positioned(
                bottom: -40,
                right: -40,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10+',
                         style: AppTextStyles.h2.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Años de Experiencia',
                        style: AppTextStyles.bodyLarge.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 100),
        // Text Side
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('SOBRE NOSOTROS', style: AppTextStyles.overline),
               const SizedBox(height: 24),
               Text(
                 'Construyendo el futuro con bases sólidas.',
                 style: AppTextStyles.h2.copyWith(color: Colors.white),
               ),
               const SizedBox(height: 32),
               Text(
                 'En RZ Desarrollos Inmobiliarios, no solo construimos edificios, creamos hogares y comunidades. Nuestra pasión es transformar espacios en oportunidades de vida y negocio, priorizando siempre la calidad, la innovación y la sostenibilidad.',
                 style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400], height: 1.8),
               ),
               const SizedBox(height: 24),
               Text(
                 'Desde la planificación hasta la entrega, nuestro equipo multidisciplinario asegura que cada detalle supere las expectativas de nuestros clientes e inversionistas.',
                 style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400], height: 1.8),
               ),
               const SizedBox(height: 48),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white30),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      textStyle: AppTextStyles.button,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: const Text('MÁS SOBRE NOSOTROS'),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SOBRE NOSOTROS', style: AppTextStyles.overline),
        const SizedBox(height: 24),
        Text(
          'Construyendo el futuro con bases sólidas.',
          style: AppTextStyles.h2.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 32),
        Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
         ),
         const SizedBox(height: 40),
         Text(
            'En RZ Desarrollos Inmobiliarios, no solo construimos edificios, creamos hogares y comunidades. Nuestra pasión es transformar espacios en oportunidades de vida y negocio, priorizando siempre la calidad, la innovación y la sostenibilidad.',
            style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400], height: 1.8),
          ),
          const SizedBox(height: 48),
           OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white30),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                textStyle: AppTextStyles.button,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            child: const Text('MÁS SOBRE NOSOTROS'),
          ),
      ],
    );
  }
}
