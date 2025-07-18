import 'package:flutter/material.dart';
import 'package:gusto_master/data/models/dog_breed.dart';

class DogCard extends StatelessWidget {
  DogCard({super.key, required this.dog});
  final DogBreed dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.network(dog.imageUrl),
        ),
        Text('Name: ${dog.name}'),
        Text('Proposito: ${dog.bredFor}'),
        Text('Tipo de raza: ${dog.breedGroup}'),
        Text('Tiempo de vida: ${dog.lifeSpan}'),
      ],
    );
  }
}
