import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onExploreTap;
  final VoidCallback? onContactTap;

  const HeroSection({
    super.key,
    this.onExploreTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height, // Full screen height
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80',
              fit: BoxFit.cover,
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(1.0, 1.0),
                end: const Offset(1.05, 1.05),
                duration: 10.seconds,
              ),
          ),
          
          // Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          
          // Gradient
           Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60), // Offset for navbar
                  
                  // Top decoration
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(height: 1, width: 48, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Text(
                        'ARQUITECTURA & PRESTIGIO',
                        style: AppTextStyles.overline,
                      ),
                      const SizedBox(width: 12),
                      Container(height: 1, width: 48, color: AppColors.primary),
                    ],
                  ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.5, end: 0),
                  
                  const SizedBox(height: 24),
                  
                  // Main Title
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.h1.copyWith(color: Colors.white),
                      children: [
                        const TextSpan(text: 'RZ '),
                        TextSpan(
                          text: 'Desarrollos',
                          style: AppTextStyles.h1.copyWith(
                            color: AppColors.primary.withOpacity(0.9),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 300.ms, duration: 800.ms).scale(),

                  const SizedBox(height: 32),
                  
                  // Description
                  Container(
                     constraints: const BoxConstraints(maxWidth: 700),
                     padding: const EdgeInsets.only(left: 20),
                     decoration: const BoxDecoration(
                       border: Border(left: BorderSide(color: AppColors.primary, width: 2))
                     ),
                     child: Text(
                      'Redefiniendo el horizonte con una visión arquitectónica audaz. Espacios de lujo diseñados para quienes exigen exclusividad.',
                      style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[300]),
                      textAlign: TextAlign.left,
                     ),
                  ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideX(begin: 0.1, end: 0),

                  const SizedBox(height: 48),

                  // Buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: onExploreTap,
                        icon: const Icon(Icons.arrow_forward, size: 16),
                        label: const Text('VER PROYECTOS'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          textStyle: AppTextStyles.button,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                      ),
                      OutlinedButton(
                         onPressed: onContactTap,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white30),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                           textStyle: AppTextStyles.button,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('AGENDAR CITA'),
                      ),
                    ],
                  ).animate().fadeIn(delay: 900.ms).moveY(begin: 20, end: 0),
                ],
              ),
            ),
          ),
          
          // Scroll Indicator
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white.withOpacity(0.5),
                size: 40,
              ).animate(onPlay: (controller) => controller.repeat())
              .moveY(begin: -10, end: 10, duration: 1.seconds, curve: Curves.easeInOut)
              .then()
              .moveY(begin: 10, end: -10, duration: 1.seconds, curve: Curves.easeInOut),
            ),
          )
        ],
      ),
    );
  }
}
