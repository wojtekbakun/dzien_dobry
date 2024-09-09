class Plant {
  String name;
  String photo;
  Map<String, dynamic> data;

  Plant({
    required this.name,
    required this.photo,
    required this.data,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String name,
        'photo': String photo,
        'data': Map<String, dynamic> data,
      } =>
        Plant(
          name: name,
          photo: photo,
          data: data,
        ),
      _ => throw const FormatException('Failed to load Plants')
    };
  }

  // Metoda do parsowania listy obiektów Plant z JSON
  static List<Plant> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) {
      return Plant.fromJson(json);
    }).toList();
  }
}
