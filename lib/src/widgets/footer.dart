import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 80, bottom: 40, left: 40, right: 40),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section (Grid)
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 900;
                  return isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 4, child: _buildBrandColumn()),
                            const SizedBox(width: 80),
                            Expanded(flex: 2, child: _buildMenuColumn()),
                            Expanded(flex: 3, child: _buildOfficeColumn()),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBrandColumn(),
                            const SizedBox(height: 48),
                            _buildMenuColumn(),
                            const SizedBox(height: 48),
                            _buildOfficeColumn(),
                          ],
                        );
                },
              ),
              
              const SizedBox(height: 80),
              Divider(color: Colors.white.withOpacity(0.1)),
              const SizedBox(height: 32),

              // Bottom Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    '© 2026 RZ Desarrollos Inmobiliarios. Todos los derechos reservados.',
                    style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[600], fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text('Privacidad', style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[600], fontSize: 12)),
                      const SizedBox(width: 24),
                      Text('Legal', style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
            children: [
              Image.asset('assets/images/logo_rz.png', height: 40),
            ],
          ),
        const SizedBox(height: 24),
        Text(
          'Creando espacios que trascienden lo ordinario. Líderes en desarrollo inmobiliario de lujo en El Salvador. Innovación, calidad y compromiso en cada metro cuadrado.',
          style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[500], fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            _SocialIcon(icon: FontAwesomeIcons.facebookF),
            const SizedBox(width: 16),
            _SocialIcon(icon: FontAwesomeIcons.instagram),
            const SizedBox(width: 16),
            _SocialIcon(icon: FontAwesomeIcons.linkedinIn),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MENU', style: AppTextStyles.overline.copyWith(color: AppColors.primary)),
        const SizedBox(height: 24),
        _FooterLink(text: 'Proyectos'),
        const SizedBox(height: 16),
        _FooterLink(text: 'Sobre Nosotros'),
        const SizedBox(height: 16),
        _FooterLink(text: 'Inversionistas'),
        const SizedBox(height: 16),
        _FooterLink(text: 'Noticias'),
      ],
    );
  }

  Widget _buildOfficeColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('OFICINAS', style: AppTextStyles.overline.copyWith(color: AppColors.primary)),
        const SizedBox(height: 24),
        _ContactItem(icon: Icons.location_on, text: 'Calle Los Eucaliptos 622, San Salvador'),
        const SizedBox(height: 16),
        _ContactItem(icon: Icons.email, text: 'Info@rzdesarollosinmobiliarios.com'),
        const SizedBox(height: 16),
        _ContactItem(icon: Icons.phone, text: '+503 6694 5383'),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Center(
        child: FaIcon(icon, color: Colors.grey[400], size: 16),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400], fontSize: 14),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(width: 16),
        Text(
          text,
          style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400], fontSize: 14),
        ),
      ],
    );
  }
}
