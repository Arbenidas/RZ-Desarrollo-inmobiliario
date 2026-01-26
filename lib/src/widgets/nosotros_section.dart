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
    return Column(
      children: [
        Row(
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
        ),
        const SizedBox(height: 120),
        _buildValuesSection(isDesktop: true),
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
        const SizedBox(height: 80),
        _buildValuesSection(isDesktop: false),
      ],
    );
  }

  Widget _buildValuesSection({required bool isDesktop}) {
    final cards = [
      _ValueCard(
        icon: Icons.rocket_launch_outlined,
        title: 'Misión',
        description: 'Brindar soluciones inmobiliarias integrales y de alta calidad, desarrollando proyectos innovadores y sostenibles que satisfagan las necesidades de nuestros clientes. Nos comprometemos a la excelencia, la transparencia y el cumplimiento, contribuyendo al desarrollo urbano y al bienestar de la comunidad.',
      ),
      _ValueCard(
        icon: Icons.visibility_outlined,
        title: 'Visión',
        description: 'Ser la empresa líder en desarrollos inmobiliarios, reconocida por nuestra innovación, calidad y compromiso con el crecimiento sostenible de las ciudades, creando espacios que mejoren la vida de las personas y generen valor a nuestros clientes e inversionistas.',
      ),
      _ValueCard(
        icon: Icons.diamond_outlined,
        title: 'Valores',
        children: const [
          _BulletPoint(text: 'Compromiso con el cliente: Priorizar las necesidades y expectativas de los clientes, ofreciendo un servicio personalizado y de calidad.'),
          SizedBox(height: 8),
          _BulletPoint(text: 'Integridad y ética profesional: Actuar con honestidad y transparencia en todas las operaciones y relaciones comerciales.'),
          SizedBox(height: 8),
          _BulletPoint(text: 'Innovación y creatividad: Desarrollar proyectos únicos y adaptados a las tendencias actuales del mercado.'),
        ],
      ),
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: cards[0]),
          const SizedBox(width: 24),
          Expanded(child: cards[1]),
          const SizedBox(width: 24),
          Expanded(child: cards[2]),
        ],
      );
    } else {
      return Column(
        children: [
          cards[0],
          const SizedBox(height: 24),
          cards[1],
          const SizedBox(height: 24),
          cards[2],
        ],
      );
    }
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final List<Widget>? children;

  const _ValueCard({
    required this.icon,
    required this.title,
    this.description,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 48, color: AppColors.primary),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppTextStyles.h3.copyWith(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            height: 2,
            width: 40,
            color: AppColors.primary,
          ),
          const SizedBox(height: 24),
          if (description != null)
            Text(
              description!,
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.grey[400],
                height: 1.6,
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
          if (children != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children!,
            ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Icon(Icons.circle, size: 6, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyLarge.copyWith(
              color: Colors.grey[400],
              height: 1.6,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
