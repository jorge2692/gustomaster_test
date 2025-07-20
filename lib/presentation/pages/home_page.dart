import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/logic/preference_cubit/preference_cubit.dart';
import 'package:gusto_master/logic/preference_cubit/preference_state.dart';
import 'package:gusto_master/presentation/pages/dog_favorite_page.dart';
import 'package:gusto_master/presentation/widgets/dog_card.dart';
import 'package:gusto_master/presentation/widgets/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PreferenceCubit>().fetchDogs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gusto Master'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DogFavoritePage()));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: BlocBuilder<PreferenceCubit, HomeState>(builder: (context, state) {
        if (state is LoadingState) {
          return LoadingIndicator();
        }
        if (state is FetchDataState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.dogs.length,
                  itemBuilder: (context, index) {
                    return DogCard(dog: state.dogs[index]);
                  },
                ),
              ),
            ],
          );
        }
        if (state is ErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Error ${state.message}')],
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
