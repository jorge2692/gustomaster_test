import 'package:gusto_master/data/models/local/local_dog.dart';

abstract class DogFavoriteState{
}

class LoadingFavoriteState extends DogFavoriteState{}

class FetchedFavoriteState extends DogFavoriteState{
  final List<LocalDog> localDogs;
  FetchedFavoriteState(this.localDogs);
}

class EmptyFavoriteState extends DogFavoriteState{}

class ErrorFavoriteState extends DogFavoriteState{
  final String message;
  ErrorFavoriteState(this.message);
}
