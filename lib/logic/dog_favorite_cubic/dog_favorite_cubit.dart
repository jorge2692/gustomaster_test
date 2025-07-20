import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_state.dart';

class DogFavoriteCubit extends Cubit<DogFavoriteState>{
  final DogRepository _dogRepository;

  DogFavoriteCubit(this._dogRepository) : super(LoadingFavoriteState());

  Future<void> fetchFavoriteDogs() async {
    try {
      emit(LoadingFavoriteState());
      final dogs = await _dogRepository.getFavoriteDogs();
      emit(FetchedFavoriteState(dogs));
    } catch (e) {
      emit(ErrorFavoriteState(e.toString()));
    }
  }

  Future<void> deleteFavoriteDog(UserFavoriteDog dog) async{
    emit(LoadingFavoriteState());
    await _dogRepository.deleteFavoriteDogs(dog);
    fetchFavoriteDogs();
  }
}