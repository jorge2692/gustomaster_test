import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_cubit.dart';

/// DogFavoriteCard is a widget that displays a saved favorite dog with its details.
///
/// It shows:
/// - The custom name given by the user
/// - The original dog breed name
/// - Purpose, breed group, and lifespan
/// - An image avatar
///
/// Features:
/// - Tapping the card navigates to a detailed view of the favorite dog.
/// - Swiping (Dismissible) removes the dog from favorites using [DogFavoriteCubit].
class DogFavoriteCard extends StatelessWidget {
  const DogFavoriteCard({super.key, required this.dog});

  /// The favorite dog entry, including user-assigned name and breed data.
  final UserFavoriteDog dog;

  @override
  Widget build(BuildContext context) {
    final imageUrl = dog.dogBreed.imageUrl;

    return Dismissible(
      // Unique key for the Dismissible widget
      key: Key(dog.key.toString()),
      onDismissed: (direction) {
        // Remove from favorites on swipe
        context.read<DogFavoriteCubit>().deleteFavoriteDog(dog);
      },
      child: GestureDetector(
        onTap: () {
          // Navigate to favorite dog's detailed page
          Navigator.pushNamed(
            context,
            '/prefs/id',
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

                // Dog details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User's custom name
                      Text(
                        'Nombre Favorito: ${dog.name}',
                        style: Constanst.mediumTitle,
                      ),
                      // Original breed name
                      Text(
                        'Nombre: ${dog.dogBreed.name}',
                        style: Constanst.mediumTitle,
                      ),
                      Text(
                        'Proposito: ${dog.dogBreed.bredFor}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text('Tipo de raza: ${dog.dogBreed.breedGroup}'),
                      Text('Tiempo de vida: ${dog.dogBreed.lifeSpan}'),

                      // Just for layout consistency
                      const Row(
                        children: [Expanded(child: SizedBox())],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
