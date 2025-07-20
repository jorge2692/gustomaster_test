import 'package:gusto_master/data/models/height.dart';
import 'package:gusto_master/data/models/weight.dart';
import 'package:hive/hive.dart';
part 'local_dog.g.dart';

@HiveType(typeId: 0)

class LocalDog extends HiveObject{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String bredFor;
  @HiveField(3)
  final String breedGroup;
  @HiveField(4)
  final String lifeSpan;
  @HiveField(5)
  final String temperament;
  @HiveField(6)
  final String origin;
  @HiveField(7)
  final String imageUrl;
  // @HiveField(8)
  // final Height height;
  // @HiveField(9)
  // final Weight weight;


  LocalDog({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.imageUrl,
    // required this.height,
    // required this.weight
  });

  factory LocalDog.fromJson(Map<String, dynamic> json) {
    final String baseUrl = 'https://cdn2.thedogapi.com/images/';
    final String? imageId = json['reference_image_id'];
    final String imageUrl = imageId != null ? '$baseUrl$imageId.jpg' : '';

    return LocalDog(
      id: json['id'],
      name: json['name'] ?? 'Nombre no disponible',
      bredFor: json['bred_for'] ?? 'Propósito desconocido',
      breedGroup: json['breed_group'] ?? 'Grupo desconocido',
      lifeSpan: json['life_span'] ?? 'Duración desconocida',
      temperament: json['temperament'] ?? 'Temperamento desconocido',
      origin: json['origin'] ?? 'Origen desconocido',
      imageUrl: imageUrl,
      // height: Height.fromJson(json['height']),
      // weight: Weight.fromJson(json['weight']),
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
      // 'height': height,
      // 'weight': weight,
    };
  }
}
