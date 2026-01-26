import 'package:flutter/material.dart';
import 'dart:async';
import '../constants/app_text_styles.dart';
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
  // ignore: unused_field
  Timer? _autoScrollTimer;

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!_scrollController.hasClients) return;
      
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      
      if (currentScroll >= maxScroll) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(currentScroll + 1);
      }
    });
  }

  void _scrollLeft() {
    _autoScrollTimer?.cancel(); // Stop auto-scroll on manual interaction
    _scrollController.animateTo(
      _scrollController.offset - 400,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _autoScrollTimer?.cancel(); // Stop auto-scroll on manual interaction
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;
        final horizontalPadding = isDesktop ? 40.0 : 20.0;
        final cardWidth = isDesktop ? 500.0 : constraints.maxWidth - 60;

        // Start auto-scroll only on mobile and if not already started
        if (!isDesktop && _autoScrollTimer == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
        }
        
        return Container(
          padding: EdgeInsets.only(
            top: 0,
            bottom: isDesktop ? 80 : 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: isDesktop ? _buildDesktopHeader() : _buildMobileHeader(),
              ),
              
              SizedBox(height: isDesktop ? 48 : 32),

              // Horizontal List
              SizedBox(
                height: isDesktop ? 650 : 500,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is UserScrollNotification) {
                      // Stop auto-scroll when user manually drags the list
                      _autoScrollTimer?.cancel();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    itemCount: projectsData.length,
                    itemBuilder: (context, index) {
                      final project = projectsData[index];
                      return Padding(
                        padding: EdgeInsets.only(right: isDesktop ? 32 : 16),
                        child: SizedBox(
                          width: cardWidth,
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
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('PORTAFOLIO', style: AppTextStyles.overline.copyWith(fontSize: 14)),
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
    );
  }

  Widget _buildMobileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text('PORTAFOLIO', style: AppTextStyles.overline.copyWith(fontSize: 14)),
        const SizedBox(height: 12),
        Text(
          'Proyectos Destacados',
          style: AppTextStyles.h2.copyWith(color: Colors.white, fontSize: 28),
        ),
        const SizedBox(height: 16),
        // Navigation Arrows for mobile
        Row(
          children: [
            IconButton(
              onPressed: _scrollLeft,
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              style: IconButton.styleFrom(
                side: const BorderSide(color: Colors.white24),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10)
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: _scrollRight,
              icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              style: IconButton.styleFrom(
                side: const BorderSide(color: Colors.white24),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10)
              ),
            ),
          ],
        )
      ],
    );
  }
}
