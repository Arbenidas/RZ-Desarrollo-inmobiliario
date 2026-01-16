import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceDark,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 900;
              return isDesktop 
                  ? _buildDesktopLayout() 
                  : _buildMobileLayout();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column (Text)
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NUESTROS SERVICIOS', style: AppTextStyles.overline),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.h2.copyWith(color: Colors.white),
                  children: [
                    const TextSpan(text: 'Asesoría \n'),
                    TextSpan(
                      text: 'Profesional',
                      style: AppTextStyles.h2.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Brindamos soluciones integrales en el sector inmobiliario, respaldados por años de experiencia y un equipo de expertos comprometidos con la excelencia.',
                style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400]),
              ),
              const SizedBox(height: 48),
               TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(horizontal:0, vertical: 16),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white24))
                    ),
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'CONOCE AL EQUIPO',
                      style: AppTextStyles.button.copyWith(letterSpacing: 2.0),
                    ),
                  ),
               ),
            ],
          ),
        ),
        
        const SizedBox(width: 80),

        // Right Column (Grid)
        Expanded(
          flex: 2,
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.2,
            crossAxisSpacing: 48,
            mainAxisSpacing: 64,
            children: [
               _ServiceItem(
                icon: Icons.trending_up, 
                title: 'Inversiones Inmobiliarias', 
                description: 'Maximizamos el retorno de su inversión con análisis de mercado profundos y estrategias personalizadas para cada perfil de inversor.'
              ),
              _ServiceItem(
                icon: Icons.architecture, 
                title: 'Diseño y Construcción', 
                description: 'Desde la conceptualización hasta la entrega llave en mano, garantizamos estándares de calidad superiores y atención al detalle.'
              ),
               _ServiceItem(
                icon: Icons.business_center, 
                title: 'Gestión de Proyectos', 
                description: 'Administración eficiente de recursos y tiempos, asegurando el cumplimiento de objetivos y la satisfacción total del cliente.'
              ),
               _ServiceItem(
                icon: Icons.vpn_key, 
                title: 'Property Management', 
                description: 'Cuidamos de su patrimonio con un servicio de administración de propiedades de primera clase, garantizando tranquilidad y rentabilidad.'
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('NUESTROS SERVICIOS', style: AppTextStyles.overline),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              style: AppTextStyles.h2.copyWith(color: Colors.white),
              children: [
                const TextSpan(text: 'Asesoría \n'),
                TextSpan(
                  text: 'Profesional',
                  style: AppTextStyles.h2.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Brindamos soluciones integrales en el sector inmobiliario, respaldados por años de experiencia y un equipo de expertos comprometidos con la excelencia.',
            style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400]),
          ),
          const SizedBox(height: 48),

           _ServiceItem(
            icon: Icons.trending_up, 
            title: 'Inversiones Inmobiliarias', 
            description: 'Maximizamos el retorno de su inversión con análisis de mercado profundos y estrategias personalizadas para cada perfil de inversor.'
          ),
          const SizedBox(height: 40),
          _ServiceItem(
            icon: Icons.architecture, 
            title: 'Diseño y Construcción', 
            description: 'Desde la conceptualización hasta la entrega llave en mano, garantizamos estándares de calidad superiores y atención al detalle.'
          ),
          const SizedBox(height: 40),
          _ServiceItem(
            icon: Icons.business_center, 
            title: 'Gestión de Proyectos', 
            description: 'Administración eficiente de recursos y tiempos, asegurando el cumplimiento de objetivos y la satisfacción total del cliente.'
          ),
          const SizedBox(height: 40),
          _ServiceItem(
            icon: Icons.vpn_key, 
            title: 'Property Management', 
            description: 'Cuidamos de su patrimonio con un servicio de administración de propiedades de primera clase, garantizando tranquilidad y rentabilidad.'
          ),
       ],
     );
  }
}

class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 40),
        const SizedBox(height: 24),
        Text(title, style: AppTextStyles.h3.copyWith(color: Colors.white, fontSize: 24)),
        const SizedBox(height: 16),
        Container(width: 48, height: 1, color: Colors.white24),
         const SizedBox(height: 16),
        Text(
          description,
          style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[500], fontSize: 14),
        ),
      ],
    );
  }
}
