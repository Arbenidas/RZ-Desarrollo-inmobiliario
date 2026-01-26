import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/proyectos_section.dart';
import '../widgets/services_section.dart';
import '../widgets/nosotros_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _proyectosKey = GlobalKey();
  final GlobalKey _serviciosKey = GlobalKey();
  final GlobalKey _nosotrosKey = GlobalKey();
  final GlobalKey _contactoKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(
                  onExploreTap: () => _scrollToSection(_proyectosKey),
                  onContactTap: () => _scrollToSection(_contactoKey),
                ),
                ProyectosSection(key: _proyectosKey), 
                ServicesSection(key: _serviciosKey),
                NosotrosSection(key: _nosotrosKey),
                ContactSection(key: _contactoKey),
                const Footer(),
              ],
            ),
          ),
          
          NavBar(
            onProyectosTap: () => _scrollToSection(_proyectosKey),
            onServiciosTap: () => _scrollToSection(_serviciosKey),
            onNosotrosTap: () => _scrollToSection(_nosotrosKey),
            onContactoTap: () => _scrollToSection(_contactoKey),
          ), 
        ],
      ),
    );
  }
}
