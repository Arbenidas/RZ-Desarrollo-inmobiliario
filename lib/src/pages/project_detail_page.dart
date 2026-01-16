import 'package:flutter/material.dart';
import '../models/project.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/video_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          // App Bar with Main Image
          SliverAppBar(
            expandedHeight: 400,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.backgroundDark,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                project.title,
                style: AppTextStyles.h2.copyWith(
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.black.withOpacity(0.8), blurRadius: 10),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  project.imageUrl.startsWith('http')
                      ? Image.network(project.imageUrl, fit: BoxFit.cover)
                      : Image.asset(project.imageUrl, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location & Description
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text(project.location, style: AppTextStyles.bodyLarge.copyWith(color: AppColors.primary)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    project.description,
                    style: AppTextStyles.bodyLarge.copyWith(color: Colors.white, height: 1.6, fontSize: 18),
                  ),
                  const SizedBox(height: 32),

                  // Features
                  if (project.features.isNotEmpty) ...[
                    Text('CARACTERÍSTICAS', style: AppTextStyles.overline),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: project.features.map((feature) => Chip(
                        label: Text(feature),
                        backgroundColor: Colors.white10,
                        labelStyle: const TextStyle(color: Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        side: BorderSide.none,
                      )).toList(),
                    ),
                    const SizedBox(height: 48),
                  ],

                  // Gallery
                  if (project.galleryImages.isNotEmpty) ...[
                     Text('GALERÍA', style: AppTextStyles.overline),
                     const SizedBox(height: 24),
                     // Use a wrapping layout or masonry-like grid
                     LayoutBuilder(
                       builder: (context, constraints) {
                         // Simple Masonry implementation using Row of Columns for web stability
                         // Or just a GridView with flexible aspect ratio?
                         // User requested "más grande" and "distribuido de mejor manera".
                         // Let's use a non-uniform grid.
                         
                         return GridView.builder(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                             maxCrossAxisExtent: 600, // Larger items
                             childAspectRatio: 16/10, // Wider aspect ratio
                             crossAxisSpacing: 24,
                             mainAxisSpacing: 24,
                           ),
                           itemCount: project.galleryImages.length,
                           itemBuilder: (context, index) {
                             final imagePath = project.galleryImages[index];
                             return Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 boxShadow: [
                                   BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
                                 ],
                               ),
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(8),
                                 child: imagePath.startsWith('http')
                                     ? Image.network(imagePath, fit: BoxFit.cover)
                                     : Image.asset(imagePath, fit: BoxFit.cover),
                               ),
                             );
                           },
                         );
                       },
                     ),
                     const SizedBox(height: 48),
                  ],

                  // Videos with Alternating Layout (Zig-Zag)
                  if (project.videoUrls.isNotEmpty) ...[
                    Text('VIDEOS DEL PROYECTO', style: AppTextStyles.overline),
                    const SizedBox(height: 48),
                    
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: project.videoUrls.length,
                      itemBuilder: (context, index) {
                        final videoPath = project.videoUrls[index];
                        final isEven = index % 2 == 0;
                        
                        // For Palmares (and others requested), we want text description alongside video.
                        // Since `Project` model only has one main description, we can use features or generic text, 
                        // OR just alternate the video alignment to make it dynamic.
                        // User said: "pones el video a la derecha, pon informacion a la izquierda".
                        // We will use the features list distributed or repeat the main desc? 
                        // Better: Use a snippet of the description or a feature for each video.
                        
                        final infoText = project.features.isNotEmpty 
                            ? project.features[index % project.features.length] 
                            : project.title;
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final isDesktop = constraints.maxWidth > 800;
                              
                              if (!isDesktop) {
                                // Mobile: Stack Vertically
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Container(
                                      height: 300,
                                      width: double.infinity,
                                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8), 
                                          child: VideoWidget(
                                            videoPath: videoPath,
                                            isSilent: project.areVideosSilent,
                                          ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Text(infoText, style: AppTextStyles.h3.copyWith(color: Colors.white)),
                                    const SizedBox(height: 8),
                                    Text("Descubre más sobre ${project.title} en este recorrido.", style: AppTextStyles.bodyLarge),
                                  ],
                                );
                              }

                              // Desktop: Alternating Row
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: isEven 
                                  ? [
                                      // Text Left, Video Right
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(infoText, style: AppTextStyles.h3.copyWith(color: Colors.white, fontSize: 32)),
                                              const SizedBox(height: 16),
                                              Text(
                                                "Explora cada detalle de ${project.title}. Un entorno diseñado para tu bienestar y exclusividad.",
                                                style: AppTextStyles.bodyLarge.copyWith(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: 500, // Larger video height
                                          decoration: BoxDecoration(
                                            color: Colors.black, 
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12), 
                                            child: VideoWidget(videoPath: videoPath)
                                          ),
                                        ),
                                      ),
                                    ]
                                  : [
                                      // Video Left, Text Right
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: 500, // Larger video height
                                          decoration: BoxDecoration(
                                            color: Colors.black, 
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(12), 
                                            child: VideoWidget(videoPath: videoPath)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(infoText, style: AppTextStyles.h3.copyWith(color: Colors.white, fontSize: 32)),
                                              const SizedBox(height: 16),
                                              Text(
                                                "Vive la experiencia de ${project.title}. Espacios únicos que conectan con la naturaleza.",
                                                style: AppTextStyles.bodyLarge.copyWith(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                  
                  const SizedBox(height: 60),
                  // Back Button
                  Center(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),
                      child: const Text('VOLVER A PROYECTOS'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
