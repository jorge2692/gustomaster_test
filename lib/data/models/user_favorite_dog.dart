import 'dart:convert';
import 'package:gusto_master/data/models/dog_breed.dart';

class UserFavoriteDog {
  final String name;
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
