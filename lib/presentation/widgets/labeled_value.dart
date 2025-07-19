import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';

class LabeledValue extends StatelessWidget {
  const LabeledValue({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey.shade300)
      ),
      child: Column(
        children: [
          Text(title, style: Constanst.mediumTitle,),
          SizedBox(height: 10,),
          Text(description, style: Constanst.mediumText,),
        ],
      ),
    );
  }
}
