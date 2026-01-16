import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class NavBar extends StatelessWidget {
  final VoidCallback? onProyectosTap;
  final VoidCallback? onServiciosTap;
  final VoidCallback? onNosotrosTap;
  final VoidCallback? onContactoTap;

  const NavBar({
    super.key,
    this.onProyectosTap,
    this.onServiciosTap,
    this.onNosotrosTap,
    this.onContactoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent,
          ],
        ),
        border: Border(
           bottom: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Area
          Row(
            children: [
              Image.asset(
                'assets/images/logo_rz.png', 
                height: 48,
              ),
              const SizedBox(width: 12),
            ],
          ),

          // Desktop Menu (Hidden on Mobile)
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _NavLink(title: 'Proyectos', onTap: onProyectosTap ?? () {}),
                const SizedBox(width: 32),
                _NavLink(title: 'Servicios', onTap: onServiciosTap ?? () {}),
                const SizedBox(width: 32),
                _NavLink(title: 'Nosotros', onTap: onNosotrosTap ?? () {}),
                const SizedBox(width: 32),
                _ContactButton(onTap: onContactoTap),
              ],
            )
          else
            IconButton(
              onPressed: () {}, // TODO: Open Mobile Drawer
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            )
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title.toUpperCase(),
        style: AppTextStyles.sans.copyWith(
          color: Colors.grey[300],
          fontSize: 12,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _ContactButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.primary.withOpacity(0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Text(
        'CONTACTO',
        style: AppTextStyles.button.copyWith(color: AppColors.primary),
      ),
    );
  }
}
