import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/data/repositories/dog_repository.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_cubit.dart';
import 'package:gusto_master/logic/dog_favorite_cubic/dog_favorite_state.dart';
import 'package:gusto_master/presentation/widgets/dog_favorite_card.dart';
import 'package:gusto_master/presentation/widgets/loading_indicator.dart';

class DogFavoritePage extends StatefulWidget {
  const DogFavoritePage({super.key});

  @override
  State<DogFavoritePage> createState() => _DogFavoritePageState();
}

class _DogFavoritePageState extends State<DogFavoritePage> {
  List<UserFavoriteDog> dogsList = [];
  final DogFavoriteCubit cubit = DogFavoriteCubit(DogRepository());

  @override
  void initState() {
    // context.read<DogFavoriteCubit>().fetchFavoriteDogs();
  cubit.fetchFavoriteDogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context)=> cubit,
        child: BlocBuilder<DogFavoriteCubit, DogFavoriteState>(
          bloc: cubit,
          builder: (context, state) {
            if(state is LoadingFavoriteState){
              return LoadingIndicator();
            }
            if(state is ErrorFavoriteState){
              return Center(
                child: Text(state.message),
              );
            }
            if (state is FetchedFavoriteState){
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
            if(state is EmptyFavoriteState){
              return Center(
                child: Text('VACIO PERRO'),
              );
            }
            return SizedBox.shrink();
          }
        ),
      ),
    );
  }
}
