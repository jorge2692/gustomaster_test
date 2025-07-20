import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/presentation/widgets/labeled_value.dart';
import 'package:gusto_master/presentation/widgets/text_span_widget.dart';

/// DogFavoriteDetailsPage displays detailed information about a dog
/// that the user has marked as a favorite.
///
/// It retrieves a [UserFavoriteDog] object from the navigation route
/// and shows information such as:
/// - Custom favorite name
/// - Origin
/// - Lifespan
/// - Breed group
/// - Purpose, temperament, height, and weight
class DogFavoriteDetailsPage extends StatelessWidget {
  DogFavoriteDetailsPage({super.key, this.dog});

  // The favorite dog selected by the user
  UserFavoriteDog? dog;

  @override
  Widget build(BuildContext context) {
    // Retrieve the favorite dog from the navigation route arguments
    dog = ModalRoute.of(context)?.settings.arguments as UserFavoriteDog;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
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
                dog!.dogBreed.imageUrl,
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
                // Custom favorite name
                Text(dog!.name, style: Constanst.largeTitle),
                SizedBox(height: 10,),
                // Summary info row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabeledValue(
                      title: 'Origen',
                      description: dog!.dogBreed.origin,
                    ),
                    LabeledValue(
                      title: 'Tiempo de vida',
                      description: dog!.dogBreed.lifeSpan,
                    ),
                    LabeledValue(
                      title: 'Tipo de Raza',
                      description: dog!.dogBreed.breedGroup,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Detailed characteristics
                TextSpanWidget(
                  title: 'Proposito: ',
                  description: dog!.dogBreed.bredFor,
                ),
                const SizedBox(height: 10),
                TextSpanWidget(
                  title: 'Temperamento: ',
                  description: dog!.dogBreed.temperament,
                ),
                const SizedBox(height: 10),
                TextSpanWidget(
                  title: 'Altura: ',
                  description: '${dog!.dogBreed.height.metric} cm',
                ),
                const SizedBox(height: 10),
                TextSpanWidget(
                  title: 'Altura: ',
                  description: '${dog!.dogBreed.height.imperial}"',
                ),
                const SizedBox(height: 10),
                TextSpanWidget(
                  title: 'Peso: ',
                  description: '${dog!.dogBreed.weight.metric} Kg',
                ),
                const SizedBox(height: 10),
                TextSpanWidget(
                  title: 'Peso: ',
                  description: '${dog!.dogBreed.weight.imperial} Lb',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
