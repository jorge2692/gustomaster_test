import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_cubit.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_state.dart';
import 'package:gusto_master/presentation/widgets/dog_favorite_card.dart';
import 'package:gusto_master/presentation/widgets/loading_indicator.dart';

/// DogFavoritePage displays the list of dogs the user has marked as favorites.
///
/// It uses a [DogFavoriteCubit] to manage the state of the favorites list,
/// including loading, error, empty, and data states.
///
/// The page shows:
/// - A loading indicator while fetching data.
/// - An error message if fetching fails.
/// - A message and icon if there are no favorites.
/// - A scrollable list of favorite dog cards if data is available.
class DogFavoritePage extends StatefulWidget {
  const DogFavoritePage({super.key});

  @override
  State<DogFavoritePage> createState() => _DogFavoritePageState();
}

class _DogFavoritePageState extends State<DogFavoritePage> {
  // List of favorite dogs (currently unused outside UI state)
  List<UserFavoriteDog> dogsList = [];

  // Cubit responsible for managing favorite dog states
  final DogFavoriteCubit cubit = DogFavoriteCubit(DogRepository());

  @override
  void initState() {
    super.initState();
    // Fetch favorites when the page is initialized
    cubit.fetchFavoriteDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos', style: Constanst.largeTitle),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<DogFavoriteCubit, DogFavoriteState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is LoadingFavoriteState) {
              return LoadingIndicator();
            }

            if (state is ErrorFavoriteState) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is FetchedFavoriteState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.localDogs.length,
                      itemBuilder: (context, index) {
                        return DogFavoriteCard(dog: state.localDogs[index]);
                      },
                    ),
                  ),
                ],
              );
            }

            if (state is EmptyFavoriteState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: const Icon(
                        Icons.pets_outlined,
                        size: 150,
                      ),
                    ),
                    Text('No hay Favoritos', style: Constanst.mediumTitle),
                  ],
                ),
              );
            }

            // Default fallback if no state matches
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
