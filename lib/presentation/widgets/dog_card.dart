import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/presentation/pages/dog_details.dart';
import 'package:gusto_master/presentation/widgets/dog_button_add.dart';

class DogCard extends StatelessWidget {
  DogCard({super.key, required this.dog});
  final DogBreed dog;

  @override
  Widget build(BuildContext context) {
    final imageUrl = dog.imageUrl;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DogDetails(dog: dog)));
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                maxRadius: 40,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${dog.name}',
                      style: Constanst.mediumTitle,
                    ),
                    Text(
                      'Proposito: ${dog.bredFor}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text('Tipo de raza: ${dog.breedGroup}'),
                    Text('Tiempo de vida: ${dog.lifeSpan}'),
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        DogButtonAdd(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
