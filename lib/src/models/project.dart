class Project {
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final List<String> galleryImages;
  final List<String> videoUrls;
  final List<String> features;
  final bool areVideosSilent; // Controls video player behavior (GIF-like vs Full Player)

  const Project({
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    this.galleryImages = const [],
    this.videoUrls = const [],
    this.features = const [],
    this.areVideosSilent = false,
  });
}

final List<Project> projectsData = [
  Project(
    title: 'Cumbres de Coatepeque',
    location: 'Coatepeque, Santa Ana Este',
    description: 'Disfruta de momentos inolvidables con terrenos desde 286 v² hasta 1,000 v². Amenidades exclusivas: Cabañas para Airbnb, senderismo, área de picnic y lago artificial. A solo 15 minutos del Lago de Coatepeque.',
    imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80',
    galleryImages: [
      'assets/cumbres/img_0568.jpg',
      'assets/cumbres/img_1996.jpg',
      'assets/cumbres/img_2010.jpg',
      'assets/cumbres/img_2028.jpg',
      'assets/cumbres/congo.jpg',
    ],
    videoUrls: [
      'assets/cumbres/congop.mp4',
      'assets/cumbres/video_nuevo_cumbres.mp4',
    ],
    features: ['Lago Artificial', 'Senderismo', 'Cabañas Airbnb', 'Seguridad 24/7'],
  ),
  Project(
    title: 'Palmares de Salinitas',
    location: 'Acajutla, Sonsonate',
    description: 'Inversión inmobiliaria junto al mar. 76 lotes exclusivos de 488 m² con acceso a playa de arena blanca, piscina, bar, mini golf y fogatas entre palmares. Un paraíso natural para tu descanso.',
    imageUrl: 'assets/images/palmares_1.jpg',
    galleryImages: [
       'assets/images/palmares_1.jpg',
       'assets/images/palmares_2.jpg',
       'assets/images/palmares_3.jpg',
    ],
    videoUrls: [
      'assets/palmares/clip_1.mp4',
      'assets/palmares/clip_5.mp4',
    ],
    features: ['Acceso a Playa', 'Club de Playa', 'Mini Golf', 'Piscinas', 'Seguridad Privada'],
    areVideosSilent: true,
  ),
  Project(
    title: 'Pórticos de la Hacienda',
    location: 'Mercedes Umaña, Usulután',
    description: 'Tu próxima gran inversión. Lotes desde 96 v² en un entorno tranquilo y seguro, ideal para casa de campo. Cuenta con Bike Park, áreas verdes, senderismo y todos los servicios básicos.',
    imageUrl: 'assets/images/porticos_1.jpg',
    galleryImages: [
      'assets/images/porticos_1.jpg',
      'assets/images/porticos_2.jpg',
      'assets/images/porticos_3.jpg',
    ],
    videoUrls: [
      'assets/porticos/video_3_.mp4',
      'assets/porticos/video_4_.mp4',
    ],
    features: ['Bike Park', 'Senderismo', 'Áreas Verdes', 'Servicios Básicos'],
  ),
];
