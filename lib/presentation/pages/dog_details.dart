import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:gusto_master/presentation/widgets/labeled_value.dart';
import 'package:gusto_master/presentation/widgets/text_span_widget.dart';

/// DogDetails displays detailed information about a selected dog breed.
///
/// It retrieves the [DogBreed] object from the current route's arguments
/// and shows attributes such as:
/// - Name
/// - Image
/// - Origin
/// - Lifespan
/// - Breed group
/// - Purpose
/// - Temperament
/// - Height and weight (metric and imperial)
class DogDetails extends StatelessWidget {
  DogDetails({super.key, this.dog});

  // Dog data passed from the previous screen
  DogBreed? dog;

  @override
  Widget build(BuildContext context) {
    // Extracts the DogBreed argument from the current route
    dog = ModalRoute.of(context)?.settings.arguments as DogBreed;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dog image section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(
                dog!.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Dog details section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dog!.name, style: Constanst.largeTitle),

                // Quick facts row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabeledValue(title: 'Origen', description: dog!.origin),
                    LabeledValue(title: 'Tiempo de vida', description: dog!.lifeSpan),
                    LabeledValue(title: 'Tipo de Raza', description: dog!.breedGroup),
                  ],
                ),
                const SizedBox(height: 10),

                // Detailed characteristics
                TextSpanWidget(title: 'Proposito: ', description: dog!.bredFor),
                const SizedBox(height: 10),
                TextSpanWidget(title: 'Temperamento: ', description: dog!.temperament),
                const SizedBox(height: 10),
                TextSpanWidget(title: 'Altura: ', description: '${dog!.height.metric} cm'),
                const SizedBox(height: 10),
                TextSpanWidget(title: 'Altura: ', description: '${dog!.height.imperial}"'),
                const SizedBox(height: 10),
                TextSpanWidget(title: 'Peso: ', description: '${dog!.weight.metric} Kg'),
                const SizedBox(height: 10),
                TextSpanWidget(title: 'Peso: ', description: '${dog!.weight.imperial} Lb'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
