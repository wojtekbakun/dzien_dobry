class Plant {
  String name;
  String scientificName;
  String imageLink;
  Map<String, dynamic> data;
  List toDos;

  Plant({
    required this.name,
    required this.scientificName,
    required this.imageLink,
    required this.data,
    required this.toDos,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'plant_name': String name,
        'common_name': String scientificName,
        'image': String imageLink,
        'sensor_data': Map<String, dynamic> data,
        'to_do': List toDo,
      } =>
        Plant(
          name: name,
          scientificName: scientificName,
          imageLink: imageLink,
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
