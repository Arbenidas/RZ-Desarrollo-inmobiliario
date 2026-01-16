import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String location;
  final String description;
  final String imageUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        width: MediaQuery.of(context).size.width * 0.8, // Responsive width
        constraints: const BoxConstraints(maxWidth: 900),
        margin: const EdgeInsets.only(right: 32),
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: _isHovered ? [
             const BoxShadow(color: AppColors.primary, blurRadius: 20, spreadRadius: -10)
          ] : [],
        ),
        child: Stack(
          children: [
            // Image
            SizedBox(
              height: 500,
              width: double.infinity,
              child: (widget.imageUrl.startsWith('http') 
                  ? Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      color: _isHovered ? null : Colors.black.withOpacity(0.3),
                      colorBlendMode: BlendMode.darken,
                    )
                  : Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      color: _isHovered ? null : Colors.black.withOpacity(0.3),
                      colorBlendMode: BlendMode.darken,
                    )
              ).animate(target: _isHovered ? 1 : 0)
              .scale(begin: const Offset(1,1), end: const Offset(1.05, 1.05), duration: 500.ms),
            ),
            
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                    stops: [0.1, 0.6],
                  ),
                ),
              ),
            ),

            // Content
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(height: 1, width: 32, color: AppColors.primary),
                        const SizedBox(width: 16),
                        Text(widget.location.toUpperCase(), style: AppTextStyles.overline),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(widget.title, style: AppTextStyles.h2.copyWith(color: Colors.white)),
                    const SizedBox(height: 24),
                    
                     Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.description,
                            style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey[400], fontSize: 16),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 32),
                         // Explore Button
                         TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_outward, size: 16),
                          label: const Text('EXPLORAR RESIDENCIA'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                            textStyle: AppTextStyles.button.copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.primary),
                          ),
                         )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
