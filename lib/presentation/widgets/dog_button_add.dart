import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/logic/home_cubit/home_cubit.dart';

class DogButtonAdd extends StatelessWidget {
  const DogButtonAdd({super.key, required this.callback});
  final Function (String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink,
      ),
      child: IconButton(
        color: Colors.white,
        onPressed: (){
          _dialogBuilder(context);

        },
        icon: Icon(Icons.add),
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nombre para tu amigo'),
          content: const TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Nombre'),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Guardar'),
              onPressed: () {
                callback('dog');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

