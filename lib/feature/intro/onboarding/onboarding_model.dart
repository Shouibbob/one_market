class OnboardingModel {
  final String title;
  final String description;
  final String image;
  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardingModel> splashSlider = [
    OnboardingModel(
      title: 'توصيل سريع',
      description: 'الوصف',
      image: 'assets/images/img1.png',
    ),
    OnboardingModel(
      title: 'وفر أكتر',
      description: 'الوصف',
      image: 'assets/images/img2.png',
    ),
    OnboardingModel(
      title: 'أهلا بيك',
      description: 'الوصف',
      image: 'assets/images/img3.png',
    ),
  ];