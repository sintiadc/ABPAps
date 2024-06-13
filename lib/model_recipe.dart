class Recipe {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      description: json['detail_resep'] ?? 'No description available',
      imageUrl: json['picture'] ?? '',
    );
  }
}
