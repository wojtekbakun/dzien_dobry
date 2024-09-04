class Plant {
  String name;
  Map<String, dynamic> data;

  Plant({
    required this.name,
    required this.data,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String name,
        'data': Map<String, dynamic> data,
      } =>
        Plant(
          name: name,
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
