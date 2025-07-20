import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/logic/home_cubit/home_cubit.dart';
import 'package:gusto_master/presentation/widgets/dog_button_add.dart';

/// DogCard is a widget that displays brief information about a dog breed
/// inside a card layout. It includes:
/// - An image
/// - Name
/// - Purpose (bredFor)
/// - Breed group
/// - Lifespan
///
/// It also provides a "+" button (via [DogButtonAdd]) that allows the user
/// to save the dog as a favorite with a custom name.
///
/// When tapped, the card navigates to a detailed view of the dog.
class DogCard extends StatelessWidget {
  const DogCard({super.key, required this.dog});

  /// The dog breed to display.
  final DogBreed dog;

  @override
  Widget build(BuildContext context) {
    final imageUrl = dog.imageUrl;

    return GestureDetector(
      onTap: () {
        // Navigate to dog details screen with the selected dog as argument
        Navigator.pushNamed(
          context,
          '/dog_details',
          arguments: dog,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Dog image
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                maxRadius: 40,
              ),
              const SizedBox(width: 10),

              // Dog details and favorite button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      'Name: ${dog.name}',
                      style: Constanst.mediumTitle,
                    ),
                    // Purpose
                    Text(
                      'Proposito: ${dog.bredFor}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    // Breed group and lifespan
                    Text('Tipo de raza: ${dog.breedGroup}'),
                    Text('Tiempo de vida: ${dog.lifeSpan}'),

                    // Add to favorites button
                    Row(
                      children: [
                        const Expanded(child: SizedBox()), // Spacer
                        DogButtonAdd(
                          callback: (data) {
                            // Save dog with custom name to favorites
                            context.read<HomeCubit>().saveFavoriteDog(
                              UserFavoriteDog(name: data, dogBreed: dog),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
