
import 'package:gusto_master/data/models/user_favorite_dog.dart';

abstract class DogFavoriteState{
}

class LoadingFavoriteState extends DogFavoriteState{}

class FetchedFavoriteState extends DogFavoriteState{
  final List<UserFavoriteDog> localDogs;
  FetchedFavoriteState(this.localDogs);
}

class EmptyFavoriteState extends DogFavoriteState{}

class ErrorFavoriteState extends DogFavoriteState{
  final String message;
  ErrorFavoriteState(this.message);
}
