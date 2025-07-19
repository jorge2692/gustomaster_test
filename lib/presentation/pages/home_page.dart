
import 'package:flutter/material.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/sources/dog_api_service.dart';
import 'package:gusto_master/presentation/widgets/dog_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<DogBreed> dogsList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    proofService().then((breeds) {
      setState(() {
        dogsList = breeds;
        isLoading = false;
      });
    });
  }

  Future<List<DogBreed>> proofService() async {
    final api = DogApiService();

    try {
      final breeds = await api.fetchBreeds();
      return breeds;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

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
