import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/data/models/local/local_dog.dart';
import 'package:hive/hive.dart';

class DogLocalSource{
  Box<LocalDog> box = Hive.box<LocalDog>('test');
  void saveDogs(DogBreed dog){
    var dogExist = box.containsKey(dog.id);
    if(dogExist){
      print('Mi Perro: este perro existe');
      return;
    }
    box.add(LocalDog(
        id: dog.id,
        name: dog.name,
        bredFor: dog.bredFor,
        breedGroup: dog.breedGroup,
        lifeSpan: dog.lifeSpan,
        temperament: dog.temperament,
        origin: dog.origin,
        imageUrl: dog.imageUrl,
        // height: dog.height,
        // weight: dog.weight
      ),
    );
  }
  
  void printInfo(){
    var info = box.values.toList();
    info.forEach((action) => print(action));
  }
  
}