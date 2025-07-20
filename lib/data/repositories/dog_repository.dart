import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/sources/dog_api_source.dart';
import 'dart:async';

class DogRepository {
  Future<List<DogBreed>> proofService() async {
    final api = DogApiSource();
    try {
      final breeds = await api.fetchBreeds();
      return breeds;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
