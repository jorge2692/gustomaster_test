import 'dart:convert';

import 'package:gusto_master/data/models/dog_breed.dart';
import 'package:http/http.dart' as http;

class DogApiService{
  final String baseUrl = 'https://api.thedogapi.com/v1';

  Future<List<DogBreed>> fetchBreeds() async {
    final response = await http.get(Uri.parse('$baseUrl/breeds'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => DogBreed.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load breeds');
    }
  }
}