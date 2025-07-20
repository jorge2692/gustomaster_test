import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';

/// A widget that displays a labeled value inside a styled container.
///
/// It shows a [title] and a [description] stacked vertically,
/// with padding and a rounded border.
///
/// The widget sizes itself proportionally to the screen size.
class LabeledValue extends StatelessWidget {
  const LabeledValue({
    super.key,
    required this.title,
    required this.description,
  });

  /// The title text shown on top, styled with mediumTitle style.
  final String title;

  /// The description text shown below the title, styled with mediumText style.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(title, style: Constanst.mediumTitle, textAlign: TextAlign.center, ),
          const SizedBox(height: 10),
          Text(description, style: Constanst.mediumText),
        ],
      ),
    );
  }
}
