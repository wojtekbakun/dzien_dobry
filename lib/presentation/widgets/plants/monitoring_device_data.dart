import 'package:dzien_dobry/consts/paddings.dart';
import 'package:dzien_dobry/presentation/widgets/plants/measurement_card.dart';
import 'package:flutter/material.dart';

class MonitoringDeviceData extends StatelessWidget {
  const MonitoringDeviceData({super.key});

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
              itemCount: 1,
              itemBuilder: (context, index) {
                return const MeasurementCard(
                  measurementName: 'Temperatura',
                  measurementValue: '22°C',
                  icon: Icons.thermostat,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
