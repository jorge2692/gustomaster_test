import 'package:flutter/material.dart';
import 'package:gusto_master/core/constants.dart';
import 'package:gusto_master/data/models/user_favorite_dog.dart';
import 'package:gusto_master/presentation/widgets/labeled_value.dart';
import 'package:gusto_master/presentation/widgets/text_span_widget.dart';

class DogFavoriteDetailsPage extends StatelessWidget {
  const DogFavoriteDetailsPage({super.key, required this.dog});
  final UserFavoriteDog dog;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body:
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    dog.dogBreed.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(dog.name, style: Constanst.largeTitle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabeledValue(title: 'Origen', description: dog.dogBreed.origin ),
                        LabeledValue(title: 'Tiempo de vida', description: dog.dogBreed.lifeSpan ),
                        LabeledValue(title: 'Tipo de Raza', description: dog.dogBreed.breedGroup ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    TextSpanWidget(title: 'Proposito: ', description: dog.dogBreed.bredFor),
                    SizedBox(height: 10,),
                    TextSpanWidget(title: 'Temperamento: ', description: dog.dogBreed.temperament),
                    SizedBox(height: 10,),
                    TextSpanWidget(title: 'Altura: ', description: '${dog.dogBreed.height.metric} cm'),
                    SizedBox(height: 10,),
                    TextSpanWidget(title: 'Altura: ', description: '${dog.dogBreed.height.imperial}"'),
                    SizedBox(height: 10,),
                    TextSpanWidget(title: 'Peso: ', description: '${dog.dogBreed.weight.metric} Kg'),
                    SizedBox(height: 10,),
                    TextSpanWidget(title: 'Peso: ', description: '${dog.dogBreed.weight.imperial} Lb'),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
