import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/preference_cubit/preference_state.dart';

class PreferenceCubit extends Cubit<HomeState> {
  final DogRepository _dogRepository;

  PreferenceCubit(this._dogRepository) : super(DogInitial());

  Future<void> fetchDogs() async {
    try {
      emit(LoadingState());
      final dogs = await _dogRepository.proofService();
      emit(FetchDataState(dogs));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
