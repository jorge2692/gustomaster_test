import 'package:flutter/material.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/presentation/pages/widgets/dog_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<DogBreed> dogsList = [
    DogBreed(
      id: 1,
      name: "Affenpinscher",
      bredFor: "Small rodent hunting",
      breedGroup: "Toy",
      lifeSpan: "10 - 12 years",
      imageUrl: "https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg",
    ),
    DogBreed(
      id: 2,
      name: "Bulldog",
      bredFor: "Companionship",
      breedGroup: "Non-Sporting",
      lifeSpan: "8 - 10 years",
      imageUrl: "https://cdn2.thedogapi.com/images/B1d5me547.jpg",
    ),
    DogBreed(
      id: 3,
      name: "Chihuahua",
      bredFor: "Companionship",
      breedGroup: "Toy",
      lifeSpan: "14 - 16 years",
      imageUrl: "https://cdn2.thedogapi.com/images/ry1kWe5VQ.jpg",
    ),
    DogBreed(
      id: 4,
      name: "Dachshund",
      bredFor: "Badger hunting",
      breedGroup: "Hound",
      lifeSpan: "12 - 16 years",
      imageUrl: "https://cdn2.thedogapi.com/images/SyYtQe5VQ.jpg",
    ),
    DogBreed(
      id: 5,
      name: "Akita",
      bredFor: "Hunting bear",
      breedGroup: "Working",
      lifeSpan: "10 - 12 years",
      imageUrl: "https://cdn2.thedogapi.com/images/BFRYBufpm.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gusto Master'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dogsList.length,
              itemBuilder: (context, index) {
                return DogCard(dog: dogsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
