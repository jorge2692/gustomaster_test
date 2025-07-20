import 'dart:convert';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:hive/hive.dart';

part 'user_favorite_dog.g.dart';

@HiveType(typeId: 2)
class UserFavoriteDog extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final DogBreed dogBreed;

  UserFavoriteDog({
    required this.name,
    required this.dogBreed,
  });

  factory UserFavoriteDog.fromRawJson(String str) =>
      UserFavoriteDog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserFavoriteDog.fromJson(Map<String, dynamic> json) => UserFavoriteDog(
    name: json["name"],
    dogBreed: DogBreed.fromJson(json["dogBreed"]), // ← corregido aquí
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dogBreed": dogBreed.toJson(), // ← corregido aquí
  };
}
