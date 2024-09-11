import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/plants/measurement_card.dart';
import 'package:flutter/material.dart';

class MonitoringDeviceData extends StatelessWidget {
  final Map<String, dynamic> sensorData;
  const MonitoringDeviceData({super.key, required this.sensorData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MyPaddings.symmetricHorizontal,
            child: Text(
              'Dane z urządzenia monitorującego',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 124,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: sensorData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: MyPaddings.weatherDotsHorizontal,
                  child: MeasurementCard(
                    measurement: sensorData[sensorTypes(index + 1)[0]],
                    measurementType: sensorTypes(index + 1),
                    icon: sensorTypes(index + 1)[2],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List sensorTypes(int measurement) {
  List<dynamic> temperature = ['temperature', 'Temperatura', Icons.thermostat];
  List<dynamic> humidity = ['humidity', 'Wilgotność', Icons.water_drop];
  List<dynamic> sun = ['sun', 'Słońce', Icons.sunny];
  List<dynamic> battery = ['battery', 'Bateria', Icons.battery_3_bar];
  switch (measurement) {
    case 1:
      return temperature;
    case 2:
      return humidity;
    case 3:
      return sun;
    case 4:
      return battery;
    default:
      return [];
  }
}
