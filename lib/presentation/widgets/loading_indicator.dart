import 'package:flutter/material.dart';

/// A simple loading spinner centered on the screen.
///
/// Displays a green [CircularProgressIndicator] to indicate loading state.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }
}
