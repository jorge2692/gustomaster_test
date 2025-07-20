import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/logic/home_cubit/home_cubit.dart';
import 'package:gusto_master/logic/home_cubit/home_state.dart';
import 'package:gusto_master/presentation/widgets/dog_card.dart';
import 'package:gusto_master/presentation/widgets/loading_indicator.dart';

/// HomePage is the main screen of the app.
///
/// It is responsible for:
/// - Fetching the list of dog breeds when the screen is initialized.
/// - Monitoring internet connectivity changes using the `connectivity_plus` package.
/// - Displaying different UI states (loading, data, or error) based on the current [HomeState].
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Connectivity instance for monitoring network status
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    // Fetch dog data when the widget is first built
    context.read<HomeCubit>().fetchDogs();

    // Initialize connectivity monitoring
    initConnectivity();

    // Listen to connectivity changes
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    // Cancel connectivity subscription when the widget is disposed
    _connectivitySubscription.cancel();
    super.dispose();
  }

  /// Checks the current network status and updates the app accordingly
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status: $e');
      return;
    }

    if (!mounted) return;

    return _updateConnectionStatus(result);
  }

  /// Notifies the HomeCubit about the updated connectivity status
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
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/prefs');
            },
          )
        ],
      ),

      /// Builds UI based on the current [HomeState]
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
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
                    height: 200,
                    width: 200,
                    child: const Icon(Icons.wifi_off, size: 150),
                  ),
                  Text('Error ${state.message}', style: Constanst.mediumTitle),
                ],
              ),
            );
          }

          // Default empty state
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
