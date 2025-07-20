import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_cubit.dart';
import 'package:gusto_master/presentation/pages/dog_favorite_details_page.dart';

class DogFavoriteCard extends StatelessWidget {
  const DogFavoriteCard({super.key, required this.dog});
  final UserFavoriteDog dog;

  @override
  Widget build(BuildContext context) {
    final imageUrl = dog.dogBreed.imageUrl;
    return Dismissible(
      key:Key(dog.key.toString()),
      onDismissed: (direction){
        context.read<DogFavoriteCubit>().deleteFavoriteDog(dog);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DogFavoriteDetailsPage(dog: dog)));
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
                        'Name: ${dog.dogBreed.name}',
                        style: Constanst.mediumTitle,
                      ),
                      Text(
                        'Proposito: ${dog.dogBreed.bredFor}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text('Tipo de raza: ${dog.dogBreed.breedGroup}'),
                      Text('Tiempo de vida: ${dog.dogBreed.lifeSpan}'),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
