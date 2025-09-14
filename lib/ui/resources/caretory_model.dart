class CategoryModel {
  final String name;
  final String id;
  final String imagePath;
  final String stats;

  const CategoryModel({
    required this.name,
    required this.id,
    required this.imagePath,
    required this.stats,
  });

  // Pre-defined categories
  static const CategoryModel general = CategoryModel(
    name: 'General',
    id: 'general',
    imagePath: 'assets/images/General_image.png',
    stats: '169 Hug × 54 Hug',
  );

  static const CategoryModel business = CategoryModel(
    name: 'Business',
    id: 'business',
    imagePath: 'assets/images/Business_image.png',
    stats: '203 Hug × 67 Hug',
  );

  static const CategoryModel sports = CategoryModel(
    name: 'Sports',
    id: 'sports',
    imagePath: 'assets/images/sport_image.png',
    stats: '145 Hug × 42 Hug',
  );

  static const CategoryModel technology = CategoryModel(
    name: 'Technology',
    id: 'technology',
    imagePath: 'assets/images/technology_image.png',
    stats: '189 Hug × 61 Hug',
  );

  static const CategoryModel entertainment = CategoryModel(
    name: 'Entertainment',
    id: 'entertainment',
    imagePath: 'assets/images/Popcorn_image.png',
    stats: '176 Hug × 58 Hug',
  );

  static List<CategoryModel> get all => [
    general,
    business,
    sports,
    technology,
    entertainment,
  ];

  String? get title => null;
}
