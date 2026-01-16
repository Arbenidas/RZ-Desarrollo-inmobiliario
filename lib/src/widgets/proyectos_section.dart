import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_colors.dart';
import 'project_card.dart';

class ProyectosSection extends StatefulWidget {
  const ProyectosSection({super.key});

  @override
  State<ProyectosSection> createState() => _ProyectosSectionState();
}

class _ProyectosSectionState extends State<ProyectosSection> {
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> projects = [
    {
      'title': 'Cumbres de Coatepeque',
      'location': 'Coatepeque, Santa Ana Este',
      'description': 'Disfruta de momentos inolvidables con terrenos desde 286 v² hasta 1,200 v². Amenidades exclusivas: Cabañas para Airbnb, senderismo, área de picnic y lago artificial. A solo 15 minutos del Lago de Coatepeque.',
      'imageUrl': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80' 
    },
    {
      'title': 'Palmares de Salinitas',
      'location': 'Acajutla, Sonsonate',
      'description': 'Inversión inmobiliaria junto al mar. 76 lotes exclusivos de 488 m² con acceso a playa de arena blanca, piscina, bar, mini golf y fogatas entre palmares. Un paraíso natural para tu descanso.',
      'imageUrl': 'assets/images/palmares_1.jpg'
    },
     {
      'title': 'Pórticos de la Hacienda',
      'location': 'Mercedes Umaña, Usulután',
      'description': 'Tu próxima gran inversión. Lotes desde 96 v² en un entorno tranquilo y seguro, ideal para casa de campo. Cuenta con Bike Park, áreas verdes, senderismo y todos los servicios básicos.',
      'imageUrl': 'assets/images/porticos_1.jpg'
    },
    {
      'title': 'Precera Tower 2',
      'location': 'San Benito',
      'description': 'Un icono de altura y sofisticación. Apartamentos con vistas panorámicas de 360 grados a la ciudad y el volcán, definiendo el nuevo estándar de vida vertical.',
      'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDU2mXj24dgsgk7avo-85BbBTm0ihNwpu9UpA9bZupqX_fx0GhyTvuzLGGhFhFQIxvKgzZ8vvQTKGJVn1CofkpOcrZosfhTAzLUoNDlY8uB4QtWY5nP9jmseUaQJtSKCLWvvn-_GLCQ7g18xvrcW4NVKZlIzKSbNppUdHdtiRjGlO6V3HRQRYkBRT9tHAE2bGfAzcqezprGVZYg5TMiuLmp_wWT6c39BzJ6_udtS3vsoH6E-QEPI4Kx3eqncTawH_tuyinWnPV_vOmP'
    },
    {
      'title': 'Constructural A Home',
      'location': 'Escalón',
      'description': 'Diseño residencial contemporáneo que fusiona la naturaleza con interiores minimalistas de lujo. Un refugio privado en el corazón de la ciudad.',
      'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuByW-MedMg7KNtqXlG4nBDel8Uf_00GI84LWRI2ddmTt7oBzmulACiye0T1ZSYRbZbcn2Kp5MNXQRgrdY9wh7JV2Xn5KK-u4SCwqbVEZHYkQhp4CRkWdw9gdGg0ikn2FLztNQAYBiuRhIlvS3rNDqKouKvKHggaCtmH3tl3sjnK0mPkKRvqfeSfCYsEO55WcC-gkbXHBT2GtYOZ7qwjqp3VYW0fzTlqpm6PAb-ZcvP5Wq4UFVjCixDVQOFa8QBFEOreana4oWuc0zvM'
    },
    {
      'title': 'Luxurio Apartments',
      'location': 'Santa Elena',
      'description': 'Complejo habitacional exclusivo con amenidades de primer nivel: piscina infinita, gimnasio y áreas sociales diseñadas para el disfrute total.',
      'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDYl5JE49pt_iREtCQa-7rae3BqjcRWLu319zxpkbeA9iYKxtxV_ZW6eY6wFQn3j7xXgYJDBfo0kQUSR_JA9ONFCqwYk3reXTepYSru66XIq0aR7mNQ05Gdt4CmbiJUYK5rF4HQFHubvinS2dPoY1C2DN5eYuFMCg73vOQ5GXtvINrmihHA0VcIghPeiR4X9fgXjW8IjYecO-NFza5rCQM8UdoT4w381Gwjpy6lipIqMTagPYWI3e8HrOKxMGv1KNMbedoyEM1LdwdX'
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NUESTROS PROYECTOS', style: AppTextStyles.overline),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.h2.copyWith(color: Colors.white),
                        children: [
                          const TextSpan(text: 'Nuestros '),
                          TextSpan(
                            text: 'Proyectos',
                            style: AppTextStyles.h2.copyWith(
                              fontStyle: FontStyle.italic,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Controls
                Row(
                  children: [
                    IconButton(
                      onPressed: _scrollLeft,
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        shape: const RoundedRectangleBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: _scrollRight,
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.white,
                      style: IconButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        shape: const RoundedRectangleBorder(),
                         padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 48),

          // Horizontal List
          SizedBox(
            height: 600,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 40, right: 40),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  title: project['title']!,
                  location: project['location']!,
                  description: project['description']!,
                  imageUrl: project['imageUrl']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
