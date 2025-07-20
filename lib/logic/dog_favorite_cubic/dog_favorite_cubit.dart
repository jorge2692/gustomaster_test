import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_state.dart';

/// DogFavoriteCubit manages the state of the user's favorite dogs.
///
/// Responsibilities:
/// - Fetching favorite dogs from the repository.
/// - Emitting corresponding states based on data presence or errors.
/// - Deleting a favorite dog and refreshing the list.
class DogFavoriteCubit extends Cubit<DogFavoriteState> {
  final DogRepository _dogRepository;

  /// Initializes the cubit with a loading state.
  DogFavoriteCubit(this._dogRepository) : super(LoadingFavoriteState());

  /// Fetches the list of favorite dogs from the repository.
  /// Emits:
  /// - [LoadingFavoriteState] while loading.
  /// - [FetchedFavoriteState] if data is available.
  /// - [EmptyFavoriteState] if no favorites are found.
  /// - [ErrorFavoriteState] if an error occurs.
  Future<void> fetchFavoriteDogs() async {
    try {
      emit(LoadingFavoriteState());
      final dogs = await _dogRepository.getFavoriteDogs();
      if (dogs.isNotEmpty) {
        return emit(FetchedFavoriteState(dogs));
      }
      emit(EmptyFavoriteState());
      return;
    } catch (e) {
      emit(ErrorFavoriteState(e.toString()));
    }
  }


  /// Deletes a specific favorite dog and refreshes the list.
  ///
  /// Emits [LoadingFavoriteState] while deleting.
  Future<void> deleteFavoriteDog(UserFavoriteDog dog) async {
    emit(LoadingFavoriteState());
    await _dogRepository.deleteFavoriteDogs(dog);
    fetchFavoriteDogs();
  }
}
