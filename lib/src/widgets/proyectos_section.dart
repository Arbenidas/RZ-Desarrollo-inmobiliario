import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_colors.dart';
import 'project_card.dart';
import '../models/project.dart';
import '../pages/project_detail_page.dart';

class ProyectosSection extends StatefulWidget {
  const ProyectosSection({super.key});

  @override
  State<ProyectosSection> createState() => _ProyectosSectionState();
}

class _ProyectosSectionState extends State<ProyectosSection> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 400,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 400,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _openProjectDetails(Project project) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProjectDetailPage(project: project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('PORTAFOLIO', style: AppTextStyles.overline),
                     const SizedBox(height: 16),
                     Text('Proyectos Destacados', style: AppTextStyles.h2.copyWith(color: Colors.white)),
                  ],
                ),
                
                // Navigation Arrows
                Row(
                  children: [
                    IconButton(
                      onPressed: _scrollLeft,
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12)
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                       onPressed: _scrollRight,
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                       style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        shape: const CircleBorder(),
                         padding: const EdgeInsets.all(12)
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          
          const SizedBox(height: 48),

          // Horizontal List
          SizedBox(
            height: 650, // Height for card + hover space
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              itemCount: projectsData.length,
              itemBuilder: (context, index) {
                final project = projectsData[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: SizedBox(
                    width: 500, // Increased from 400 to 500
                    child: ProjectCard(
                      title: project.title,
                      location: project.location,
                      description: project.description,
                      imageUrl: project.imageUrl,
                      onExploreTap: () => _openProjectDetails(project),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
