import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/models/local/local_dog.dart';
import 'package:gusto_master/data/sources/dog_api_source.dart';
import 'dart:async';

import 'package:gusto_master/data/sources/dog_local_source.dart';

class DogRepository {
  final api = DogApiSource();
  final local = DogLocalSource();


  Future<List<DogBreed>> getApiService() async {
    try {
      final breeds = await api.fetchBreeds();
      return breeds;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<LocalDog>> getFavoriteDogs() async {
    try {
      final breeds = await local.getFavoriteDogs();
      return breeds;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  void saveFavoriteDogs(DogBreed dog){
    local.saveDogs(dog);
  }

  Future<void> deleteFavoriteDogs(LocalDog dog)async{
    await local.deleteDog(dog);
  }
}
