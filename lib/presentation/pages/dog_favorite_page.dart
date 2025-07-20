import 'package:flutter/material.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/models/height.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/models/weight.dart';
import 'package:gusto_master/presentation/widgets/dog_favorite_card.dart';

class DogFavoritePage extends StatefulWidget {
  const DogFavoritePage({super.key});

  @override
  State<DogFavoritePage> createState() => _DogFavoritePageState();
}

class _DogFavoritePageState extends State<DogFavoritePage> {
  List<UserFavoriteDog> dogsList = [];

  List<UserFavoriteDog> mockFavoriteDogs = [
    UserFavoriteDog(
      name: 'Max',
      dogBreed: DogBreed(
        id: 1,
        name: 'Affenpinscher',
        bredFor: 'Small rodent hunting, lapdog',
        breedGroup: 'Toy',
        lifeSpan: '10 - 12 years',
        temperament: 'Stubborn, Curious, Playful',
        origin: 'Germany, France',
        imageUrl: 'https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg',
        height: Height(imperial: '9 - 11.5', metric: '23 - 29'),
        weight: Weight(imperial: '6 - 13', metric: '3 - 6'),
      ),
    ),
    UserFavoriteDog(
      name: 'Luna',
      dogBreed: DogBreed(
        id: 2,
        name: 'Afghan Hound',
        bredFor: 'Coursing and hunting',
        breedGroup: 'Hound',
        lifeSpan: '10 - 13 years',
        temperament: 'Aloof, Clownish, Dignified',
        origin: 'Afghanistan, Iran, Pakistan',
        imageUrl: 'https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg',
        height: Height(imperial: '25 - 27', metric: '64 - 69'),
        weight: Weight(imperial: '50 - 60', metric: '23 - 27'),
      ),
    ),
    UserFavoriteDog(
      name: 'Rocky',
      dogBreed: DogBreed(
        id: 3,
        name: 'Akita',
        bredFor: 'Hunting bears',
        breedGroup: 'Working',
        lifeSpan: '10 - 14 years',
        temperament: 'Docile, Alert, Responsive',
        origin: 'Japan',
        imageUrl: 'https://cdn2.thedogapi.com/images/BFRYBufpm.jpg',
        height: Height(imperial: '24 - 28', metric: '61 - 71'),
        weight: Weight(imperial: '65 - 115', metric: '29 - 52'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mockFavoriteDogs.length,
              itemBuilder: (context, index) {
                return DogFavoriteCard(dog: mockFavoriteDogs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
