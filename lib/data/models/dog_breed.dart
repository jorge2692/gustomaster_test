class DogBreed {
  final int id;
  final String name;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String imageUrl;

  DogBreed({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.imageUrl,
  });

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      id: json['id'],
      name: json['name'],
      bredFor: json['bred_for'] ?? 'Unknown',
      breedGroup: json['breed_group'] ?? 'Unknown',
      lifeSpan: json['life_span'] ?? 'Unknown',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bred_for': bredFor,
      'breed_group': breedGroup,
      'life_span': lifeSpan,
      'image_url': imageUrl,
    };
  }
}
