import 'package:flutter/material.dart';

/// DogButtonAdd is a reusable widget that shows a "+" icon button.
///
/// When pressed, it opens a dialog prompting the user to enter a custom name.
/// Once a valid name is entered and confirmed, it triggers a [callback]
/// passing the entered name.
class DogButtonAdd extends StatelessWidget {
  const DogButtonAdd({super.key, required this.callback});

  /// Callback to return the entered name to the parent widget.
  final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink,
      ),
      child: IconButton(
        color: Colors.white,
        icon: const Icon(Icons.add),
        onPressed: () {
          _dialogBuilder(context);
        },
      ),
    );
  }

  /// Displays a dialog with a [TextField] to let the user input a name.
  ///
  /// If a valid (non-empty) name is entered and "Guardar" is pressed,
  /// the [callback] function is called with the entered name.
  Future<void> _dialogBuilder(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nombre para tu amigo'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Nombre'),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Guardar'),
              onPressed: () {
                final nombre = controller.text.trim();
                if (nombre.isNotEmpty) {
                  callback(nombre);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

