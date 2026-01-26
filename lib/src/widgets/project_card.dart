import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final VoidCallback? onExploreTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    this.onExploreTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onExploreTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            border: Border.all(color: Colors.white10),
            boxShadow: _isHovered ? [
               const BoxShadow(color: AppColors.primary, blurRadius: 20, spreadRadius: -10)
            ] : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Expanded(
                flex: 4, 
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    widget.imageUrl.startsWith('http')
                        ? Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[900]),
                          ),
                    // Overlay on hover
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isHovered ? 0.2 : 0.0,
                      child: Container(color: Colors.black),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                flex: 3, 
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.location.toUpperCase(),
                        style: AppTextStyles.overline.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.title,
                        style: AppTextStyles.h3.copyWith(color: Colors.white, fontSize: 26), 
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                         child: Text(
                          widget.description,
                          style: AppTextStyles.bodyLarge.copyWith(fontSize: 14),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      
                      // Button Visual
                      Row(
                        children: [
                          Text(
                            'EXPLORAR RESIDENCIA',
                            style: AppTextStyles.button.copyWith(
                              color: _isHovered ? AppColors.primary : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: _isHovered ? AppColors.primary : Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
