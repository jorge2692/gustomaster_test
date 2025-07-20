import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';

/// A widget that displays a styled title followed by a description inline.
///
/// The [title] uses a medium title style, and the [description] uses a medium text style.
class TextSpanWidget extends StatelessWidget {
  const TextSpanWidget({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Constanst.mediumTitle,
        text: title,
        children: [
          TextSpan(
            style: Constanst.mediumText,
            text: description,
          )
        ],
      ),
    );
  }
}
