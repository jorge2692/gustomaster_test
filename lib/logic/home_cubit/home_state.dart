import 'package:gusto_master/data/models/dog_breed.dart';

/// Base class for all states related to the home screen.
abstract class HomeState {}

/// Initial state before any data is loaded or action is taken.
class DogInitial extends HomeState {}

/// State emitted while data is being loaded from the API.
class LoadingState extends HomeState {}

/// State emitted when no data is found.
class EmptyState extends HomeState {}

/// State emitted when dog data is successfully fetched from the API.
///
/// [dogs] contains the list of dog breeds.
class FetchDataState extends HomeState {
  final List<DogBreed> dogs;

  FetchDataState(this.dogs);
}

/// State emitted when an error occurs during data fetching or connectivity issues.
///
/// [message] provides a description of the error.
class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}
