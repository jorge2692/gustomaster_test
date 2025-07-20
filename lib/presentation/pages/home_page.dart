import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/logic/home_cubit/home_cubit.dart';
import 'package:gusto_master/logic/home_cubit/home_state.dart';
import 'package:gusto_master/presentation/pages/dog_favorite_page.dart';
import 'package:gusto_master/presentation/widgets/dog_card.dart';
import 'package:gusto_master/presentation/widgets/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchDogs();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status, ${e}');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    context.read<HomeCubit>().changedInternetStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gusto Master'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DogFavoritePage()));
                },
                icon: Icon(Icons.favorite))
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
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
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        top: 0
                      ),
                      height: 200,
                      width: 200,
                      child: const Icon(
                        Icons.wifi_off,
                        size: 150,
                      )),
                  Text('Error ${state.message}', style: Constanst.mediumTitle,)
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        }));
  }
}
