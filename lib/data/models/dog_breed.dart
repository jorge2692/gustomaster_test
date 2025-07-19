import 'package:gusto_master/data/models/height.dart';
import 'package:gusto_master/data/models/weight.dart';

class DogBreed {
  final int id;
  final String name;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final String origin;
  final String imageUrl;
  final Height height;
  final Weight weight;


  DogBreed({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.imageUrl,
    required this.height,
    required this.weight
  });

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    final String baseUrl = 'https://cdn2.thedogapi.com/images/';
    final String? imageId = json['reference_image_id'];
    final String imageUrl = imageId != null ? '$baseUrl$imageId.jpg' : '';

    return DogBreed(
      id: json['id'],
      name: json['name'] ?? 'Nombre no disponible',
      bredFor: json['bred_for'] ?? 'Propósito desconocido',
      breedGroup: json['breed_group'] ?? 'Grupo desconocido',
      lifeSpan: json['life_span'] ?? 'Duración desconocida',
      temperament: json['temperament'] ?? 'Temperamento desconocido',
      origin: json['origin'] ?? 'Origen desconocido',
      imageUrl: imageUrl,
      height: Height.fromJson(json['height']),
      weight: Weight.fromJson(json['weight']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bred_for': bredFor,
      'breed_group': breedGroup,
      'life_span': lifeSpan,
      'temperament': temperament,
      'origin': origin,
      'image_url': imageUrl,
      'height': height,
      'weight': weight,
    };
  }
}
