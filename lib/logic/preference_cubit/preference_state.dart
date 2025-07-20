import 'package:gusto_master/data/models/dog_breed.dart';

abstract class HomeState {}

class DogInitial extends HomeState {}

class LoadingState extends HomeState {}

class EmptyState extends HomeState {}

class FetchDataState extends HomeState {
  final List<DogBreed> dogs;

  FetchDataState(this.dogs);
}

class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}
