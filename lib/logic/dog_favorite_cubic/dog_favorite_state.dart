
import 'package:gusto_master/data/models/user_favorite_dog.dart';

/// Base class for all favorite dogs UI states.
abstract class DogFavoriteState {}

/// State emitted while loading favorite dogs from local storage.
class LoadingFavoriteState extends DogFavoriteState {}

/// State emitted when favorite dogs have been successfully fetched.
///
/// [localDogs] contains the list of user-saved favorite dogs.
class FetchedFavoriteState extends DogFavoriteState {
  final List<UserFavoriteDog> localDogs;

  FetchedFavoriteState(this.localDogs);
}

/// State emitted when there are no favorite dogs saved.
class EmptyFavoriteState extends DogFavoriteState {}

/// State emitted when an error occurs while fetching or processing favorites.
///
/// [message] provides details about the error.
class ErrorFavoriteState extends DogFavoriteState {
  final String message;

  ErrorFavoriteState(this.message);
}
