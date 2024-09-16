import 'dart:convert';
import 'dart:typed_data';

class Plant {
  String name;
  String scientificName;
  Uint8List imageData;
  Map<String, dynamic> data;
  String toDos;

  Plant({
    required this.name,
    required this.scientificName,
    required this.imageData,
    required this.data,
    required this.toDos,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String name,
        'scientificName': String scientificName,
        'data': Map<String, dynamic> data,
        'image': String imageData,
        'toDo': String toDo,
      } =>
        Plant(
          name: name,
          scientificName: scientificName,
          imageData: base64Decode(imageData),
          data: data,
          toDos: toDo,
        ),
      _ => throw const FormatException('Failed to load Plants'),
    };
  }

  // Metoda do parsowania listy obiektów Plant z JSON
  static List<Plant> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) {
      return Plant.fromJson(json);
    }).toList();
  }
}
