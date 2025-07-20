import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:hive/hive.dart';

class DogLocalSource{
  Box<UserFavoriteDog> box = Hive.box<UserFavoriteDog>('test');
  void saveDogs(UserFavoriteDog dog){
    box.add(dog);
  }

  Future<List<UserFavoriteDog>> getFavoriteDogs()async{
    return box.values.toList();
  }

  Future<void> deleteDog(UserFavoriteDog dog) async{
    await box.delete(dog.key);
  }
  
}