import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_platform_interface/src/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/home_cubit/home_state.dart';

/// HomeCubit manages the state for the home screen, including:
/// - Fetching dog breeds from the API.
/// - Handling internet connectivity status.
/// - Saving a dog as a favorite.
class HomeCubit extends Cubit<HomeState> {
  final DogRepository _dogRepository;
  final Connectivity _connectivity;

  /// Creates a [HomeCubit] with required [DogRepository] and [Connectivity] instances.
  HomeCubit(this._dogRepository, this._connectivity) : super(DogInitial());

  /// Fetches dog breeds from the API.
  ///
  /// Emits:
  /// - [LoadingState] while fetching.
  /// - [ErrorState] if there is no internet or an exception occurs.
  /// - [FetchDataState] when data is successfully retrieved.
  Future<void> fetchDogs() async {
    var result = await _connectivity.checkConnectivity();
    try {
      emit(LoadingState());

      // If no internet connection is available, emit an error state
      if (result.first.name == 'none') {
        emit(ErrorState('No Hay Internet'));
        return;
      }

      final dogs = await _dogRepository.getApiService();
      emit(FetchDataState(dogs));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  /// Saves a dog to the local favorites storage.
  void saveFavoriteDog(UserFavoriteDog dog) {
    _dogRepository.saveFavoriteDogs(dog);
  }

  /// Updates the state based on internet connectivity changes.
  ///
  /// If disconnected, emits [ErrorState].
  /// Otherwise, refetches dog data.
  void changedInternetStatus(List<ConnectivityResult> connectionStatus) {
    if (connectionStatus.first.name == 'none') {
      emit(ErrorState('No Hay Internet'));
      return;
    }

    fetchDogs();
  }
}

