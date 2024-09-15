import 'dart:io';

import 'package:dzien_dobry/models/plant.dart';
import 'package:dzien_dobry/service/api_service.dart';
import 'package:http/http.dart' as http;

class PlantRepository {
  final ApiService apiService;

  PlantRepository(this.apiService);

  Future<List<Plant>> getPlantData() async {
    return apiService.fetchPlants();
  }

  Future<http.StreamedResponse> addPlant(String name, File imageFile) async {
    return apiService.addPlant(name, imageFile);
  }
}
