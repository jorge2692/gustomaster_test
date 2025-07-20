import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:hive/hive.dart';

class DogLocalSource{
  Box<UserFavoriteDog> box = Hive.box<UserFavoriteDog>('test');
  void saveDogs(UserFavoriteDog dog){
    // var dogExist = box.containsKey(dog.id);
    // if(dogExist){
    //   print('Mi Perro: este perro existe');
    //   return;
    // }
    box.add(dog);
  }
  
  void printInfo(){
    var info = box.values.toList();
    info.forEach((action) => print(action));
  }

  List<UserFavoriteDog> getFavoriteDogs(){
    return box.values.toList();
  }

  Future<void> deleteDog(UserFavoriteDog dog) async{
    await box.delete(dog.key);
  }
  
}