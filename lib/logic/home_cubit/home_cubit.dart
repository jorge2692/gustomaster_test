import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_platform_interface/src/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DogRepository _dogRepository;
  final Connectivity _connectivity;

  HomeCubit(this._dogRepository, this._connectivity) : super(DogInitial());

  Future<void> fetchDogs() async {
    var result = await _connectivity.checkConnectivity();
    try {
      emit(LoadingState());
      if(result.first.name == 'none'){
        emit(ErrorState('No Hay Internet'));
        return;
      }
      final dogs = await _dogRepository.getApiService();
      emit(FetchDataState(dogs));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void saveFavoriteDog(UserFavoriteDog dog){
    _dogRepository.saveFavoriteDogs(dog);
  }

  void changedInternetStatus(List<ConnectivityResult> connectionStatus){
    if(connectionStatus.first.name ==  'none'){
      emit(ErrorState('No Hay Internet'));
      return;
    }
    fetchDogs();
  }
}
